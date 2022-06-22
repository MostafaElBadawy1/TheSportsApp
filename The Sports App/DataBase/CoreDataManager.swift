//
//  CoreDataManager.swift
//  The Sports App
//
//  Created by Mostafa Elbadawy on 22/06/2022.
//


import CoreData
import UIKit

class CoreDataManger {
    static let shared = CoreDataManger()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func fetch<T: NSManagedObject>(returnType: T.Type , completion: @escaping ([T]) -> Void) {
        do {
            guard let result = try context.fetch(returnType.fetchRequest()) as? [T] else {
                return
            }
            completion(result)
        } catch {
            print("Error in saving")
        }
    }
    
    func delete<T: NSManagedObject>(returnType: T.Type, delete: T) {
        context.delete(delete.self)
        do {
            try context.save()
        } catch {
            print("Error in deleting")
        }
    }
}
