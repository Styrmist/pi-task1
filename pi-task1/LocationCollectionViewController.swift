//
//  LocationCollectionViewController.swift
//  pi-task1
//
//  Created by Kirill on 9/1/19.
//  Copyright © 2019 Kirill. All rights reserved.
//

import UIKit
import FlickrKit

class LocationCollectionViewController: UICollectionViewController, Auth {

    var photoURLs: [URL]!
    var completeAuthOp: FKDUNetworkOperation!
    var checkAuthOp: FKDUNetworkOperation!
    var userID: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let apiKey: String! = "996026186ece04d3075511e27efc76a6"
        let secret: String! = "68740228f39e90c1ß"
        let authURL: URL? = URL(string: "flickrkitdemo://auth")
        FlickrKit.shared().initialize(withAPIKey: apiKey, sharedSecret: secret)
        
        
        FlickrKit.shared().beginAuth(withCallbackURL: authURL!, permission: FKPermission.read, completion: { (url, error) -> Void in
            DispatchQueue.main.async(execute: { () -> Void in
                if ((error == nil)) {
                    let urlRequest = NSMutableURLRequest(url: url!, cachePolicy: NSURLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 30)
                    print("ookkk")
                } else {
                    let alert = UIAlertView(title: "Error", message: error?.localizedDescription, delegate: nil, cancelButtonTitle: "OK")
                    alert.show()
                }
            });
        })
        
        let flickrLocation = FKFlickrPhotosGetRecent()
        print("ok")
        FlickrKit.shared().call(flickrLocation) { (response, error) -> Void in
            DispatchQueue.main.async { () -> Void in
                print(response)
                if (response != nil) {
                    // Pull out the photo urls from the results
                    let topPhotos = response?["photos"]
                    print(topPhotos as Any)
//                    let photoArray = topPhotos?["photo"] as
//                    for photoDictionary in photoArray {
//                        let photoURL = FlickrKit.sharedFlickrKit().photoURLForSize(FKPhotoSizeSmall240, fromPhotoDictionary: photoDictionary)
//                        self.photoURLs.append(photoURL)
//                    }
                } else {
                    print("nil")
                }
            }
        }

        // Register cell classes
        self.collectionView!.register(FlickrImageCollectionViewCell.self, forCellWithReuseIdentifier: FlickrImageCollectionViewCell.reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlickrImageCollectionViewCell.reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
