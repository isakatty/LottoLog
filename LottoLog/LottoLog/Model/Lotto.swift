//
//  Lotto.swift
//  LottoLog
//
//  Created by Jisoo HAM on 6/5/24.
//

import UIKit

struct Lotto: Decodable {
    /// 전체 당첨금
    let totSellamnt: Int
    /// 1번 당첨 번호
    let drwtNo1: Int
    /// 2번 당첨 번호
    let drwtNo2: Int
    /// 3번 당첨 번호
    let drwtNo3: Int
    /// 4번 당첨 번호
    let drwtNo4: Int
    /// 5번 당첨 번호
    let drwtNo5: Int
    /// 6번 당첨 번호
    let drwtNo6: Int
    /// 보너스 당첨 번호
    let bnusNo: Int
    /// 회차
    let drwNo: Int
    /// 추첨 날짜
    let drwNoDate: String
    
    var changedDate: String {
        return drwNoDate + " 추첨"
    }
    var changedDrawNo: String {
        return String(drwNo) + "회"
    }
}

enum LottoColor: String, CaseIterable {
    case orange
    case blue
    case red
    case gray
    case green
    case etc
    
    var color: UIColor {
        switch self{
        case .orange:
            return UIColor.underTen
        case .blue:
            return UIColor.underTwenty
        case .red:
            return UIColor.underThirty
        case .gray:
            return UIColor.underFourty
        case .green:
            return UIColor.underFourtyFive
        case .etc:
            return UIColor.clear
        }
    }
    
    static func changeColor(with number: Int) -> LottoColor {
        switch number {
        case 1...10:
            return .orange
        case 11...20:
            return .blue
        case 21...30:
            return .red
        case 31...40:
            return .gray
        case 41...45:
            return .green
        default:
            return .etc
        }
    }
}
