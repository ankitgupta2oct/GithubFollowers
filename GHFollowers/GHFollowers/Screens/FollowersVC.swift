//
//  FollowersVC.swift
//  GHFollowers
//
//  Created by apple on 17/03/25.
//

import UIKit

class FollowersVC: UIViewController {
    var userName : String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.getFollowers(userName: userName, page: 1) { follower, error in
            if let error = error {
                print(error.rawValue)
            } else {
                print(follower!)
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
