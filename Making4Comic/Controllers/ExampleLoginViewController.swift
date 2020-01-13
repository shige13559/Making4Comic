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
    
    var num:Int! = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
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
    
    
    @IBAction func practice(_ sender: UIButton) {
        
        let db = Firestore.firestore()

        db.collection("rooms").whereField("status", isEqualTo: false).getDocuments { (querySnapshot, error) in

            guard var documents = querySnapshot?.documents else{
                return
            }


            if documents.isEmpty {
                // 0件だったりした時の処理
                db.collection("rooms").addDocument(data: [
                    "users": [Auth.auth().currentUser?.uid],
                    "status": false
                ])

            }else{
                let document = documents[0]
                let users = document.get("users") as! [String]
                users.count
                print(users)

                db.collection("rooms").document(document.documentID).setData([

                    "users": [Auth.auth().currentUser?.uid],
                    "status": true
                ])

            }
        }
        
        
    }

    
    
    @IBAction func count(_ sender: UIButton) {
        
        let  db = Firestore.firestore()
        
        
        db.collection("rooms").getDocuments()
        {
            (querySnapshot, err) in

            if let err = err
            {
                print("Error getting documents: \(err)");
            }
            else
            {
                var count = 0
                for document in querySnapshot!.documents {
                    count += 1
                    print("\(document.documentID) => \(document.data())");
                }

                print("Count = \(count)");
            }
        }
        
        
        
    }
    
    
    

}
