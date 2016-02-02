//
//  DetailViewController.swift
//  FinalProject
//
//  Created by BJ on 3/1/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var ownerName: UILabel!
    @IBOutlet weak var repositoryName: UILabel!
    @IBOutlet weak var repositoryDescription: UILabel!
    
    var repository: Repository?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ownerName.text = repository?.owner ?? ""
        repositoryName.text = repository?.name ?? ""
        repositoryDescription.text = repository?.repoDescription ?? ""
        
			guard let avatarURLString = repository?.avatarURL else { return }
			dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
				if let avatarURL = NSURL(string: avatarURLString), imageData = NSData(contentsOfURL: avatarURL) {
					dispatch_async(dispatch_get_main_queue()) {
						self.ownerImageView.image = UIImage(data: imageData)
					}
				}
			}
    }

}
