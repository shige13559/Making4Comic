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
import FirebaseCore

class ExampleLoginViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //追加
//        databaseRef = Database.database().reference()
        //追加
//        Database.database().isPersistenceEnabled = true
        
        
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
    
    
    @IBAction func didClickButton(_ sender: UIButton) {
        
        
        let db = Firestore.firestore()
        db.collection("users").document(Auth.auth().currentUser!.uid).setData([
            "id": Auth.auth().currentUser?.uid,
            "lastDataTime": FieldValue.serverTimestamp(), //作成日時
            "online": true
        ]) {error in
            if let err = error{
                print(err.localizedDescription)
            }
        }
        
    }
    
    
    @IBAction func logout(_ sender: UIButton) {
        
        let db = Firestore.firestore()
        db.collection("users").document(Auth.auth().currentUser!.uid).setData([
            "id": Auth.auth().currentUser?.uid,
            "lastDataTime": FieldValue.serverTimestamp(), //作成日時
            "online": false
        ]) {error in
            if let err = error{
                print(err.localizedDescription)
            }
        }
        
        
        
        
        
    }
    
    
    

}
