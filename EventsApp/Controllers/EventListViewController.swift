//
//  EventListViewController.swift
//  EventsApp
//
//  Created by Felix Liman on 14/09/21.
//

import UIKit
import CoreData

class EventListViewController: UIViewController {
    
    private lazy var root = EventListView()
    private let coreDataManager = CoreDataManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = root
        
        setupNavBar()
        coreDataManager.saveEvents(name: "New Years", date: Date(), image: #imageLiteral(resourceName: "newyear"))
        debugPrint(coreDataManager.fetchEvents())
    }
    
    func setupNavBar() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonImage = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(addEventBtnPressed))
        barButtonImage.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonImage
        navigationItem.title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @objc func addEventBtnPressed() {
        
    }
}
