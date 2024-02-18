//
//  LottoViewModel.swift
//  LottoFetch
//
//  Created by Poter Pan on 2024/2/18.
//

import Foundation

class LottoViewModel: ObservableObject {
    @Published var latestResult: LottoResult?
    
    
    func fetchLottoResults() {
        guard let url = URL(string: "https://api.taiwanlottery.com/TLCAPIWeB/Lottery/Lotto649Result?period&month=2024-02&pageNum=1&pageSize=5") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data else { return }
            do {
                let result = try JSONDecoder().decode(Content.self, from: data)
                // 由於網絡請求是在後台線程完成，更新UI的操作需要在主線程上進行，以避免界面更新不一致或程式崩潰。
                DispatchQueue.main.async {
                    if let firstEntry = result.content.lotto649Res.first {
                        self?.latestResult = LottoResult(period: firstEntry.period, drawNumberSize: firstEntry.drawNumberSize, redeemableDate: firstEntry.redeemableDate)
                    }
                }
            } catch {
                print("Failed to decode JSON", error)
            }
        }.resume()
    }
}
