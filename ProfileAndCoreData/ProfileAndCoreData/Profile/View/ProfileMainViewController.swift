//
//  ProfileMainViewController.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/21.
//

import UIKit

class ProfileMainViewController: UIViewController {
    @IBAction func didTappedProfileDesignButton(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as? UITabBarController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
