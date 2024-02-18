//
//  ContentView.swift
//  LottoFetch
//
//  Created by Poter Pan on 2024/2/18.
//

import Foundation
import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = LottoViewModel()

    var body: some View {
        VStack {
            if let lottoResult = viewModel.latestResult {
                Text("期次: \(lottoResult.periodString)")
                Text("開獎號碼(大小順序): \(lottoResult.drawNumberSizeFormatted)")
                Text("兌獎截止: \(lottoResult.redeemableDate)")
            }
        }
        .onAppear {
            viewModel.fetchLottoResults()
        }
    }
}


#Preview {
    ContentView()
}
