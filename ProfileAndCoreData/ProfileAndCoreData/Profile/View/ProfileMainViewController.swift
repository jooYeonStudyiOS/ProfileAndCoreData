//
//  ProfileMainViewController.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/21.
//

import UIKit

class ProfileMainViewController: UIViewController {
    @IBAction func didTappedProfileDesignButton(_ sender: Any) {
        if let navigationController = storyboard?.instantiateViewController(withIdentifier: "NavigationController") as? UINavigationController {
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
