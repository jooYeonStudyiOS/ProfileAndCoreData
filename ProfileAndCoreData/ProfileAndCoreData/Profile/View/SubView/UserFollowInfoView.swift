//
//  UserFollowInfoView.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/21.
//

import UIKit
import SnapKit

class UserFollowInfoView: UIView {
    @IBOutlet weak var postCountLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    
    @IBOutlet weak var followerCountLabel: UILabel!
    @IBOutlet weak var followerLabel: UILabel!
    
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    var interval: Int = 0
    
    func setupUI() {
 
        interval = Int(frame.width / 3)
        
        setupPost()
        setupFollwer()
        setupFollwing()
    }
    
    func setupPost() {
        postCountLabel.text = "7"
        postLabel.text = "post"
        
        postCountLabel.snp.makeConstraints {
            $0.leading.equalToSuperview()
        }
        
        postLabel.snp.makeConstraints {
            $0.top.equalTo(postCountLabel.snp.bottom)
            $0.centerX.equalTo(postCountLabel)
        }
    }
    
    func setupFollwer() {
        followerCountLabel.text = "0"
        followerLabel.text = "follower"
        
        followerCountLabel.snp.makeConstraints {
            $0.leading.equalTo(postCountLabel.snp.trailing).offset(interval)
        }
        
        followerLabel.snp.makeConstraints {
            $0.top.equalTo(followerCountLabel.snp.bottom)
            $0.centerX.equalTo(followerCountLabel)
        }
    }
    
    func setupFollwing() {
        followingCountLabel.text = "0"
        followingLabel.text = "following"
        
        followingCountLabel.snp.makeConstraints {
            $0.leading.equalTo(followerCountLabel.snp.trailing).offset(interval)
        }
        
        followingLabel.snp.makeConstraints {
            $0.top.equalTo(followingCountLabel.snp.bottom)
            $0.centerX.equalTo(followingCountLabel)
        }
    }
}
