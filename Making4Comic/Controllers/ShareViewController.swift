//
//  ShareViewController.swift
//  Making4Comic
//
//  Created by 原田茂大 on 2019/12/29.
//  Copyright © 2019 geshi. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    

    @IBAction func shareButton(_ sender: UIButton) {
        
//        //シェア用の画面作成
//        let shareController = UIActivityViewController(activityItems: [imageView.image], applicationActivities: nil)
//
//
//        //作成した画面を表示
//        present(shareController, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func backHomeButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backHome", sender: nil)
        
    }
    
    

}


