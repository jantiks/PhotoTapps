//
//  PhotosCollectionViewController.swift
//  PhotoTapps
//
//  Created by Tigran on 11/12/20.
//  Copyright © 2020 Tigran. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    let photos = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10",
                  "dog11", "dog12", "dog13", "dog14", "dog15"]
    
    let numberOfItems: CGFloat = 2
    let insetForSection = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let minimumInerItemSpacing: CGFloat = 20
    let minimumLineSpacing: CGFloat = 20
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        let photoName = photos[indexPath.item]
        let image = UIImage(named: photoName )
        cell.image.image = image
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "imageSegue" else{return}
        guard let imageVC = segue.destination as? ImageViewController else{return}
        let cell = sender as! PhotoCell
        imageVC.photo = cell.image.image
    }

}

extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWidth = (insetForSection.left + insetForSection.right) + minimumInerItemSpacing * (numberOfItems - 1)
        let avilableWidth = collectionView.frame.width - paddingWidth
        let itemWidth: Int = Int(avilableWidth / numberOfItems)
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insetForSection
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return minimumLineSpacing
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return minimumInerItemSpacing
    }
    
}
