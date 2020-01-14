//
//  PrepareViewController.swift
//  Making4Comic
//
//  Created by 原田茂大 on 2020/01/14.
//  Copyright © 2020 geshi. All rights reserved.
//

import UIKit

class PrepareViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
//    var inputText:String!
    
     var text = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
//         if segue.identifier == "toNext" {
//            let next = segue.destination as! PaintViewController
//            next.sendText = sender as! String
//         }
//     }
    
    
    
    @IBAction func prepareComplete(_ sender: UIButton) {
        performSegue(withIdentifier: "toNext", sender: nil)
    }
    
    func handOver(_ word:String) {
        text = word
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNext" {
            let svc = segue.destination as! PaintViewController
            svc.text = textField.text!
        }
    }
    
}
