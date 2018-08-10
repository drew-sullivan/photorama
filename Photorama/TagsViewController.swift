//
//  TagsViewController.swift
//  Photorama
//
//  Created by Drew Sullivan on 8/10/18.
//  Copyright © 2018 Drew Sullivan, DMA. All rights reserved.
//

import UIKit
import CoreData

class TagsViewController: UITableViewController {
    
    var store: PhotoStore!
    var photo: Photo!
    
    var selectedIndexPaths = [IndexPath]()
    
    let tagDataSource = TageDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = tagDataSource
        tableView.delegate = self
        
        updateTags()
    }
    
    func updateTags() {
        store.fetchAllTags {
            (tagsResult) in
            switch tagsResult {
            case let .success(tags):
                self.tagDataSource.tags = tags
                
                guard let photoTags = self.photo.tags as? Set<Tag> else {
                    return
                }
                
                for tag in photoTags {
                    if let index = self.tagDataSource.tags.index(of: tag) {
                        let indexPath = IndexPath(row: index, section: 0)
                        self.selectedIndexPaths.append(indexPath)
                    }
                }
            case let .failure(error):
                print("Error fetching tags: \(error)")
            }
            self.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
        }
    }
}
