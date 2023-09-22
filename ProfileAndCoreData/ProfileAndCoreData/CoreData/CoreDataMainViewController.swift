//
//  CoreDataMainViewController.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/21.
//

import UIKit

class CoreDataMainViewController: UIViewController {
    @IBOutlet weak var listCollectionView: UICollectionView!
    
    let manager = CoreDataManager.shared
    var list: [TaskEntity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        listCollectionView.dataSource = self
        listCollectionView.delegate = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        listCollectionView.collectionViewLayout = flowLayout
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        list = manager.readTask()
        listCollectionView.reloadData()
    }
}
