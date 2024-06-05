//
//  Lotto.swift
//  LottoLog
//
//  Created by Jisoo HAM on 6/5/24.
//

import Foundation

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
}
