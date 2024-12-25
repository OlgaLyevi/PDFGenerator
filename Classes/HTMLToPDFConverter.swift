
import UIKit
import WebKit

public class HTMLToPDFConverter: NSObject {
    
    private var webView: WKWebView!
    private var completion: ((Data?, Error?) -> Void)?

    public override init() {
        super.init()
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
    }

    public func convertHTMLToPDF(html: String, completion: @escaping (Data?, Error?) -> Void) {
        self.completion = completion
        webView.loadHTMLString(html, baseURL: nil)
    }

    public func convertHTMLFromURLToPDF(url: URL, completion: @escaping (Data?, Error?) -> Void) {
        self.completion = completion
        let request = URLRequest(url: url)
        webView.load(request)
    }
}

extension HTMLToPDFConverter: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let printFormatter = webView.viewPrintFormatter()
        let printPageRenderer = UIPrintPageRenderer()
        printPageRenderer.addPrintFormatter(printFormatter, startingAtPageAt: 0)

        let pageSize = CGSize(width: 595.2, height: 841.8)  // A4 Size
        let printableRect = CGRect(x: 0, y: 0, width: pageSize.width, height: pageSize.height)

        printPageRenderer.setValue(NSValue(cgRect: printableRect), forKey: "paperRect")
        printPageRenderer.setValue(NSValue(cgRect: printableRect), forKey: "printableRect")

        let pdfData = NSMutableData()
        UIGraphicsBeginPDFContextToData(pdfData, CGRect.zero, nil)

        for i in 0..<printPageRenderer.numberOfPages {
            UIGraphicsBeginPDFPage()
            let bounds = UIGraphicsGetPDFContextBounds()
            printPageRenderer.drawPage(at: i, in: bounds)
        }

        UIGraphicsEndPDFContext()
        completion?(pdfData as Data, nil)
    }

    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        completion?(nil, error)
    }
}
