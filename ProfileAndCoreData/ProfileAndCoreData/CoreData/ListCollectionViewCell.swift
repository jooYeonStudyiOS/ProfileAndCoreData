//
//  ListCollectionViewCell.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/22.
//

import UIKit
import SnapKit

class ListCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var isComplitedButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var task: TaskEntity?
    var index: Int?
    
    func configure(task: TaskEntity, index: Int) {
        self.task = task
        self.index = index
        
        setupLabel()
        setupButton()
    }
    
    func setupLabel() {
        guard let task = task else { return }
        
        titleLabel.text = task.title
    }
    
    func setupButton() {
        guard let task = task, let index = index else { return }
        
        if task.isComplited {
            isComplitedButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        } else {
            isComplitedButton.setImage(UIImage(systemName: "square"), for: .normal)
        }
        
        isComplitedButton.tag = index
        isComplitedButton.addTarget(self, action: #selector(updateTask(_:)), for: .touchUpInside)
    }
    
    @objc func updateTask(_ sender: UIButton) {
        let manager = CoreDataManager.shared
        guard let updateTask = manager.readTask()?[sender.tag] else { return }
        manager.updateTask(task: updateTask)
        if let collectionView = superview as? UICollectionView {
            collectionView.reloadData()
        }
    }
}

extension CoreDataMainViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let list = list else { return 0 }
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let list = list else { return UICollectionViewCell() }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ListCollectionViewCell", for: indexPath) as! ListCollectionViewCell
        cell.configure(task: list[indexPath.row], index: indexPath.row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let action = UIAlertAction(title: "확인", style: .default) { _ in
            if let deleteTask = self.list?[indexPath.row] {
                self.manager.deleteTask(task: deleteTask)
                self.list = self.manager.readTask()
                self.listCollectionView.reloadData()
            }
        }
        
        let alert = UIAlertController(title: "삭제하시겠습니까?", message: nil, preferredStyle: .alert)
        alert.addAction(cancel)
        alert.addAction(action)
        
        present(alert, animated: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: 100)
    }
}

