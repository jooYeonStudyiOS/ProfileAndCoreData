//
//  CoreDataWriteViewController.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/22.
//

import UIKit

class CoreDataWriteViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func configure() {
        titleTextField.placeholder = "task를 입력하세요"
    }
    
    @IBAction func didTappedDoneButton(_ sender: Any) {
        if let title = titleTextField.text {
            CoreDataManager.shared.addNewTask(title: title)
        }
        
        navigationController?.popViewController(animated: false)
    }
}
