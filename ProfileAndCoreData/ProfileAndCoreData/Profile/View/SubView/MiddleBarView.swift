//
//  MiddleBarView.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/21.
//

import UIKit
import SnapKit

class MiddleBarView: UIView {
    
    struct Constraint {
        static let interval = 8
    }
    
    @IBOutlet weak var followButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!
    
    func setupUI(){
        setupFollowButton()
        setupMessageButton()
        setupMoreButton()
    }
    
    func setupFollowButton() {
        followButton.setTitle("Follow", for: .normal)
        followButton.setTitleColor(.white, for: .normal)
        followButton.backgroundColor = .systemBlue
        
        followButton.layer.cornerRadius = 4
        
        followButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
    
    func setupMessageButton() {
        messageButton.setTitle("Message", for: .normal)
        messageButton.setTitleColor(.black, for: .normal)
        messageButton.backgroundColor = .white
        
        messageButton.layer.cornerRadius = 4
        messageButton.layer.borderWidth = 1.4
        messageButton.layer.borderColor = UIColor(red: 0.855, green: 0.855, blue: 0.855, alpha: 1).cgColor
        
        messageButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(followButton.snp.trailing).offset(Constraint.interval)
            $0.height.equalToSuperview()
            $0.width.equalTo(followButton.snp.width)
        }
    }
    
    func setupMoreButton() {
        
        var buttonConfig = UIButton.Configuration.filled()
        buttonConfig.title = ""
        buttonConfig.image = UIImage(named: "More")
        buttonConfig.contentInsets = .zero
        buttonConfig.baseBackgroundColor = .white
        moreButton.configuration = buttonConfig
    
        
        moreButton.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(messageButton.snp.trailing).offset(Constraint.interval)
            $0.trailing.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalTo(moreButton.snp.height)
        }
    }
}
