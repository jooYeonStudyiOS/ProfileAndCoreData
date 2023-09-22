//
//  File.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/22.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    var ageLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    var viewModel: ProfileViewModel!

    init(viewModel: ProfileViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        ageLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel).offset(20)
            make.centerX.equalToSuperview()
        }
        
        nameLabel.text = viewModel.userName
        ageLabel.text = viewModel.userAge
    }
}

