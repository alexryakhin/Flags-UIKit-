//
//  DetailViewController.swift
//  DetailViewController
//
//  Created by Alexander Bonney on 7/26/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    var countries: [String:String] = [:]
    var selectedTitle: String?
    var selectedImage: String?

    @IBOutlet var selectedFlag: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = Bundle.main.decode("flags.json")
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        title = selectedTitle
        
        if let imageToLoad = selectedImage {
            selectedFlag.image = UIImage(named: imageToLoad.lowercased())
        }
        
        selectedFlag.layer.shadowColor = UIColor.darkGray.cgColor
        selectedFlag.layer.shadowOffset = CGSize(width: 0, height: 1)
        selectedFlag.layer.shadowOpacity = 1
        selectedFlag.layer.shadowRadius = 10.0
        selectedFlag.clipsToBounds = false
    }
    
    @objc func shareTapped() {
        
        guard let image = selectedFlag.image?.jpegData(compressionQuality: 1) else {
            print("image is not found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
    

}
