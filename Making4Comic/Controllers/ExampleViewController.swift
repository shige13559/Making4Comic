//
//  ExampleViewController.swift
//  Making4Comic
//
//  Created by 原田茂大 on 2020/01/03.
//  Copyright © 2020 geshi. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {
    
    
    @IBOutlet weak var countLabel: UILabel!
    
    let date = DateManager()
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //カウントダウン
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        timer.invalidate()
        timer = nil
    }
    
    @objc func update(tm: Timer) {

        let count: Int = date.getXmaxTimeInterval()
        let count2: TimeInterval = TimeInterval(count)
        let formatter = DateComponentsFormatter()

        // 表示フォーマットを変更．.positionalや.fullで表示が変わります．
        formatter.unitsStyle = .brief
        // 使用する単位　.minuteのみにすると232,071minのように出力されます．
        formatter.allowedUnits = [.minute, .second]
        // 作成したformatterでtimeintervalをstringに変換します．
        print(formatter.string(from: count2)!) // →5mths 10days 3hr 44min 28sec
        //時間をラベルに表示
        countLabel.text = formatter.string(from: count2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

   

}
