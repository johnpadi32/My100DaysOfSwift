//
//  DetailsViewController.swift
//  Project 1-3
//
//  Created by John Padilla on 12/30/21.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    var countries: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = countries?.uppercased()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(handleShare))
        
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.systemGray4.cgColor
        
        if let imageToLoad = countries {
            imageView.image = UIImage(named: imageToLoad)
        }
    }

    @objc func handleShare() {
        print("Handle Share...")
        
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }
                
        let vc = UIActivityViewController(activityItems: [image, countries!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true, completion: nil)
    }
}
