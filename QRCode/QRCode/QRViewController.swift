//
//  ViewController.swift
//  QRCode
//
//  Created by NoboPay on 17/6/19.
//  Copyright © 2019 NoboPay. All rights reserved.
//

import UIKit

class QRViewController: UIViewController {
    @IBOutlet weak var qrimageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = generateQRCode(from: "Hacking with Swift is the best iOS coding tutorial I've ever read!")

        self.qrimageView.image = image
        // Do any additional setup after loading the view.
    }

    func generateQRCode(from string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator") {
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 7, y: 7)
            
            if let output = filter.outputImage?.transformed(by: transform) {
                return UIImage(ciImage: output)
            }
        }
        
        return nil
    }

}

