//
//  ResultViewController.swift
//  Making4Comic
//
//  Created by 原田茂大 on 2019/12/29.
//  Copyright © 2019 geshi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    let images = ["pitcher", "dinner", "tops", "sea"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    

    

}

extension ResultViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    //コレクションビューに表示するセルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    //コレクションビューのセルの設定
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //セルを取得(名前と番号で)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        //セルの中のImageViewをタグ番号で取得&h画像の設定
        let imageView = cell.contentView.viewWithTag(1) as! UIImageView
        imageView.image = UIImage(named: images[indexPath.row])
        
//        //セルの中のLabelをタグ番号で取得&文字の設定
//        let label = cell.contentView.viewWithTag(2) as! UILabel
//        label.text = "Hello World"
        
        //出来上がったセル返す
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("クリックされたよ")
        
    }
    
    
}


extension ResultViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        //画面の幅を取得
        //self.view.bounds.width:画面の幅が取れる
        let screenSize = self.view.bounds.width
        
        //画面の幅の半分の幅を計算
        let cellSize = screenSize / 2 - 3
        
        
        
        return CGSize(width: cellSize, height: cellSize)
    }
}

