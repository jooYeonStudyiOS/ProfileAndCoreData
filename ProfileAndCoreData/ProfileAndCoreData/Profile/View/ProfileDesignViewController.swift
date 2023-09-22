//
//  ProfileDesignViewController.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/21.
//

import UIKit
import SnapKit

class ProfileDesignViewController: UIViewController {
    let dummyImage = [UIImage(named: "picture1"),
                      UIImage(named: "picture2"),
                      UIImage(named: "picture3"),
                      UIImage(named: "picture4"),
                      UIImage(named: "picture5"),
                      UIImage(named: "picture6"),
                      UIImage(named: "picture7")
    ]
    
    struct Constraint {
        static let top10 = 10
        static let top14 = 14
        
        static let bottom10 = -10
        
        static let trailing15 = -15
        static let trailing16 = -16
        
        static let leading14 = 14
        static let leading15 = 15
    }
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var userPicImageView: UIImageView!
    @IBOutlet weak var userFollowInfoView: UserFollowInfoView!
    @IBOutlet weak var userInfoView: UserInfoView!
    @IBOutlet weak var middleBarView: MiddleBarView!
    @IBOutlet weak var navGalleryImageView: UIImageView!
    @IBOutlet weak var galleryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryCollectionView.dataSource = self
        galleryCollectionView.delegate = self
        
        setupUI()
    }
    
    func setupUI() {
        setupUserName()
        setupMenuButton()
        setupUserPic()
        setupFollowInfo()
        setupUserInfo()
        setupMiddleBar()
        setupNavGallery()
        setupCollection()
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
            $0.bottom.equalTo(userInfoView.snp.top).offset(-38)
            $0.leading.equalTo(userPicImageView.snp.trailing).offset(41)
            $0.trailing.equalToSuperview().offset(-28)
        }
    }
    
    func setupUserInfo() {
        userInfoView.setupUI()
        
        userInfoView.snp.makeConstraints {
            $0.top.equalTo(userPicImageView.snp.bottom).offset(Constraint.top14)
            $0.bottom.equalTo(middleBarView.snp.top).offset(-11)
            $0.leading.equalToSuperview().offset(Constraint.leading15)
            $0.trailing.equalToSuperview().offset(Constraint.trailing15)
        }
    }
    
    func setupMiddleBar() {
        middleBarView.setupUI()
        
        middleBarView.snp.makeConstraints {
            $0.bottom.equalTo(navGalleryImageView.snp.top).offset(Constraint.bottom10)
            $0.leading.equalToSuperview().offset(Constraint.leading15)
            $0.trailing.equalToSuperview().offset(Constraint.trailing15)
        }
    }

    func setupNavGallery() {
        navGalleryImageView.image = UIImage(named: "Grid")
        
        navGalleryImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(52)
            $0.bottom.equalTo(galleryCollectionView.snp.top).offset(-12.5)
        }
        
        let bottomLine = UIView()
        bottomLine.backgroundColor = .black
        
        view.addSubview(bottomLine)
        
        bottomLine.snp.makeConstraints {
            $0.top.equalTo(navGalleryImageView.snp.bottom).offset(2)
            $0.height.equalTo(1)
            $0.width.equalTo(view.frame.width / 3)
            $0.leading.equalToSuperview()
        }
    }
    
    func setupCollection() {
        if let flowLayout = galleryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .vertical
            flowLayout.minimumLineSpacing = 2
            flowLayout.minimumInteritemSpacing = 2
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        galleryCollectionView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}
