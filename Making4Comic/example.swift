//
//  example.swift
//  Making4Comic
//
//  Created by 原田茂大 on 2020/01/03.
//  Copyright © 2020 geshi. All rights reserved.
//

import Foundation
import UIKit

class DateManager {

    private let formatter = DateFormatter()
    private let date = Date()
    private var dateStr: String?
    private let calendar = Calendar(identifier: .gregorian)

    init(){
        formatter.timeZone = TimeZone.ReferenceType.local
        formatter.dateFormat = "yyyy-MM-dd-HH-mm-ss"
        dateStr = ""
    }
    //現在時刻を返します"yyyy-MM-dd-HH-mm-ss"
    func getNowDate() -> String{
        dateStr = formatter.string(from: date)
        guard let now = dateStr else { return ""}
        return now
    }
    //設定したカウントダウンの秒数を返してくれます
    func getXmaxTimeInterval() -> Int {
        guard let xmas = calendar.date(from: DateComponents(year: 2019, month: 12, day: 25)) else { return 0}
        let spanFromWow = xmas.timeIntervalSinceNow
        return Int(floor(spanFromWow))
    }

}
