//
//  NavGalleryView.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/21.
//

import UIKit
import SnapKit

class NavGalleryView: UIView {
    @IBOutlet weak var gridImageView: UIImageView!
    
    func setupUI() {
        gridImageView.image = UIImage(named: "Grid")
        
        gridImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(52)
            $0.width.equalTo(gridImageView.snp.height)
        }
        
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: frame.height - 1, width: frame.width / 3, height: 1)
        bottomLine.backgroundColor = UIColor.black.cgColor
        
        layer.addSublayer(bottomLine)
    }
}
