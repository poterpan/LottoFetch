//
//  LottoResult.swift
//  LottoFetch
//
//  Created by Poter Pan on 2024/2/18.
//

import Foundation

struct LottoResult: Decodable {
    let period: Int
    let drawNumberSize: [Int]
    let redeemableDate: String
}

extension LottoResult {
    var periodString: String {
        return String(period)
    }
    
    var drawNumberSizeFormatted: String {
        drawNumberSize.map { String($0) }.joined(separator: ", ")
    }
}

struct Lotto649Res: Decodable {
    let lotto649Res: [LottoResult]
}

struct Content: Decodable {
    let content: Lotto649Res
}
