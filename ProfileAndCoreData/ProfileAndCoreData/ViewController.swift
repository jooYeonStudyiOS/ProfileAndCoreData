//
//  ViewController.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func didTappedGoProfile(_ sender: Any) {
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        
        if let vc = profileStoryboard.instantiateViewController(withIdentifier: "ProfileMainViewController") as? ProfileMainViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
    
    @IBAction func didTappedGoCoreData(_ sender: Any) {
        let profileStoryboard = UIStoryboard(name: "CoreDataTest", bundle: nil)
        
        if let vc = profileStoryboard.instantiateViewController(withIdentifier: "CoreDataMainViewController") as? CoreDataMainViewController {
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

