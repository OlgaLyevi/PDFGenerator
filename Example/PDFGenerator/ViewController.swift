//
//  ViewController.swift
//  PDFGenerator
//
//  Created by OlgaLyevi on 09/15/2024.
//  Copyright (c) 2024 OlgaLyevi. All rights reserved.
//

import UIKit
import HTMLToPDFConverter

class ViewController: UIViewController {
    
    let pdfConverter = HTMLToPDFConverter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Example HTML content
        let htmlContent = """
        <html>
        <head>
            <title>Test PDF</title>
        </head>
        <body>
            <h1>Welcome to PDF Generation</h1>
            <p>This is a sample HTML content to be converted to PDF.</p>
        </body>
        </html>
        """

        // Convert the HTML content to PDF
        pdfConverter.convertHTMLToPDF(html: htmlContent) { [weak self] pdfData, error in
            if let error = error {
                print("Failed to generate PDF: \(error)")
            } else if let pdfData = pdfData {
                // Save PDF or share it
                self?.savePDF(data: pdfData)
            }
        }
    }

    // Save PDF to file system
    func savePDF(data: Data) {
        let fileManager = FileManager.default
        let paths = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = paths[0]
        let pdfFilePath = documentDirectory.appendingPathComponent("GeneratedPDF.pdf")
        
        do {
            try data.write(to: pdfFilePath)
            print("PDF saved at: \(pdfFilePath)")
            // Optional: Preview the PDF
            previewPDF(filePath: pdfFilePath)
        } catch {
            print("Could not save PDF: \(error)")
        }
    }
    
    // Optional: Preview the generated PDF using UIDocumentInteractionController
    func previewPDF(filePath: URL) {
        let documentController = UIDocumentInteractionController(url: filePath)
        documentController.delegate = self
        documentController.presentPreview(animated: true)
    }
}

extension ViewController: UIDocumentInteractionControllerDelegate {
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
}

