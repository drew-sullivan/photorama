//
//  TagDataSource.swift
//  Photorama
//
//  Created by Drew Sullivan on 8/10/18.
//  Copyright © 2018 Drew Sullivan, DMA. All rights reserved.
//

import UIKit
import CoreData

class TageDataSource: NSObject, UITableViewDataSource {
    
    var tags: [Tag] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        let tag = tags[indexPath.row]
        cell.textLabel?.text = tag.name
        
        return cell
    }
}
