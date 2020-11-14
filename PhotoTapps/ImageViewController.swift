//
//  ImageViewController.swift
//  PhotoTapps
//
//  Created by Tigran on 11/14/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    
    var photo: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.image = photo
    }
    
    @IBAction func shareAction(_ sender: UIButton) {
        let shareController = UIActivityViewController(activityItems: [photo!], applicationActivities: nil)
        shareController.completionWithItemsHandler = { _,bool ,_, _ in
            if bool {
                print("")
            }
            
        }
        present(shareController, animated: true, completion: nil)
    }
    

}
