//
//  ExampleLoginViewController.swift
//  Making4Comic
//
//  Created by 原田茂大 on 2020/01/06.
//  Copyright © 2020 geshi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ExampleLoginViewController: UIViewController {
    
    var databaseRef: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        databaseRef = Database.database().reference()
        Database.database().isPersistenceEnabled = true
    }
    
    
    @IBAction func doAnonymousLogin(_ sender: UIButton) {
        //匿名ユーザーとしてログイン
        Auth.auth().signInAnonymously { (result, error) in
            if (result?.user) != nil{
                //次の画面へ遷移
                self.performSegue(withIdentifier: "nextViewController", sender: nil)
            }
            
        }
    }
    
    

}
