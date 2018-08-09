//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Drew Sullivan on 8/9/18.
//  Copyright © 2018 Drew Sullivan, DMA. All rights reserved.
//

import UIKit

class PhotosViewController : UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchInterestingPhotos {
            (photosResult) -> Void in
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos")
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
            }
        }
    }
}
