//
//  UserInfoView.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/21.
//

import UIKit
import SnapKit

class UserInfoView: UIView {
    @IBOutlet weak var userInfoLabel: UILabel!
    
    func setupUI() {
        userInfoLabel.text = """
                            르탄이
                            iOS Developer 🍎
                            spartacodingclub.kr
                            """
        userInfoLabel.numberOfLines = 0
        
        userInfoLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
