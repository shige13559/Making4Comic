//
//  ShareViewController.swift
//  Making4Comic
//
//  Created by 原田茂大 on 2019/12/29.
//  Copyright © 2019 geshi. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    

    @IBAction func shareButton(_ sender: UIButton) {
        
//        //シェア用の画面作成
//        let shareController = UIActivityViewController(activityItems: [imageView.image], applicationActivities: nil)


//        //作成した画面を表示
//        present(shareController, animated: true, completion: nil)
        
        
        
        
        // キャプチャしたい枠を決める
        let rect = view.bounds
        
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        
        // ここでtrueを指定しないと、画面が変わった時に再キャプチャできない
        view.drawHierarchy(in: rect, afterScreenUpdates: true)
        
        let cont = UIGraphicsGetCurrentContext()
        view.layer.render(in: cont!)
        
        // キャプチャした画像を変数に保持
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        let activityItems = [image!]
        
        // 初期化処理
        let activityVC = UIActivityViewController(activityItems: activityItems as [Any], applicationActivities: nil)
        
        
        // UIActivityViewControllerを表示
        self.present(activityVC, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func backHomeButton(_ sender: UIButton) {
        
        performSegue(withIdentifier: "backHome", sender: nil)
        
    }
    
    
    
    
    

}


