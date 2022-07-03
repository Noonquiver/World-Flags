//
//  FlagViewController.swift
//  World Flags
//
//  Created by Camilo Hernández Guerrero on 21/06/22.
//

import UIKit

class FlagViewController: UIViewController {
    var selectedFlag: String?
    @IBOutlet var flagImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
        
        if let selectedFlag = selectedFlag {
            flagImageView.image = UIImage(named: selectedFlag)
        }
    }
    
    @objc func shareFlag() {
        guard let flag = flagImageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found.")
            return
        }
        
        let viewController = UIActivityViewController(activityItems: [flag, selectedFlag!.replacingOccurrences(of: ".png", with: "").uppercased()], applicationActivities: [])
        viewController.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        
        present(viewController, animated: true)
    }
}
