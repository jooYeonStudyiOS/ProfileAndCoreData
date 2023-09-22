//
//  CoreDataManager.swift
//  ProfileAndCoreData
//
//  Created by Jooyeon Kang on 2023/09/22.
//

import UIKit

class CoreDataManager {
    static let shared: CoreDataManager = CoreDataManager()
    
    // create
    func addNewTask(title: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newTask = TaskEntity(context: context)
        newTask.id = UUID()
        newTask.title = title
        newTask.createData = Date()
        newTask.isComplited = false
        
        do {
            try context.save()
        } catch {
            print("Failed to save new task: \(error)")
        }
    }
    
    // read
    func readTask() -> [TaskEntity]? {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = TaskEntity.fetchRequest()
        
        let sortByDateDesc = NSSortDescriptor(key: "createData", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            print("Failed to read task: \(error)")
            return nil
        }
    }
    
    
    // delete
    func deleteTask(task: TaskEntity) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
                
        do {
            context.delete(task)
            try context.save()
        } catch {
            print("Failed to delete task: \(error)")
        }
    }
    
    // update
    func updateTask(task: TaskEntity) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        task.isComplited.toggle()
        task.modifyData = Date()
        
        do {
            try context.save()
        } catch {
            print("Failed to update task: \(error)")
        }
    }
}
