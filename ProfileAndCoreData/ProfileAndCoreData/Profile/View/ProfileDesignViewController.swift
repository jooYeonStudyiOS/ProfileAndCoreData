//
//  ProfileDesignViewController.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/21.
//

import UIKit
import SnapKit

class ProfileDesignViewController: UIViewController {

    struct Constraint {
        static let top10 = 10
        static let top14 = 14
        static let trailing16 = -16
        static let leading14 = 14
    }
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var userPicImageView: UIImageView!

    @IBOutlet weak var userFollowInfoView: UserFollowInfoView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    func setupUI() {
        setupUserName()
        setupMenuButton()
        setupUserPic()
        
        setupFollowInfo()
    }
    
    func setupUserName() {
        userNameLabel.text = "nabaecamp"
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(Constraint.top10)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setupMenuButton() {
        menuButton.setImage(UIImage(named: "Menu"), for: .normal)
        menuButton.setTitle("", for: .normal)
        
        menuButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(Constraint.top14)
            $0.trailing.equalToSuperview().offset(Constraint.trailing16)
        }
    }
    
    func setupUserPic() {
        userPicImageView.image = UIImage(named: "Ellipse")
        
        userPicImageView.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(Constraint.top14)
            $0.leading.equalToSuperview().offset(Constraint.leading14)
        }
    }
    
    func setupFollowInfo() {
        userFollowInfoView.setupUI()
        
        userFollowInfoView.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom).offset(37)
            $0.leading.equalTo(userPicImageView.snp.trailing).offset(41)
            $0.trailing.equalToSuperview().offset(-28)
        }
    }
}
