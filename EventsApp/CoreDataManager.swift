//
//  CoreDataManager.swift
//  EventsApp
//
//  Created by Felix Liman on 14/09/21.
//

import UIKit
import CoreData

final class CoreDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "EventsApp")
        persistentContainer.loadPersistentStores { _, error in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveEvents(name: String, date: Date, image: UIImage) {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        event.setValue(date, forKey: "date")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try moc.fetch(fetchRequest)
            return events
        } catch {
            print(error)
            return []
        }
    }
}
