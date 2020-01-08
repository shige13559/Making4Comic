//
//  ExampleTimerViewController.swift
//  Making4Comic
//
//  Created by 原田茂大 on 2020/01/08.
//  Copyright © 2020 geshi. All rights reserved.
//

import UIKit

class ExampleTimerViewController: UIViewController {
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var addTimer = Timer()
    var timerCount = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addTimer =  Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(timerCall), userInfo: nil, repeats: true)
        
        timerLabel.text = "la"
        
        return addTimer.fire()
    }
    
    @objc func timerCall() {
        timerCount += 1
        print("timerCount: \(timerCount)")
        if timerCount > 3 {
            // タイマーを無効にする
            addTimer.invalidate()
            print("Timerは無効になりました。")
        }
        addTimer.fire()
    }
    
    
    
    
    
    
    
    

   

}
