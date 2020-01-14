//
//  MainViewController.swift
//  Making4Comic
//
//  Created by 原田茂大 on 2019/12/29.
//  Copyright © 2019 geshi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var text = String()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    


    
    @IBAction func didClickButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "make", sender: nil)
        
    }
    
    

}
