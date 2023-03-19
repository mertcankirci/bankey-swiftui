//
//  NetworkService.swift
//
//  Bankey-SwiftUI
//
//  Created by Mertcan Kırcı on 6.03.2023.
//

import SwiftUI

 class NetworkService:ObservableObject {
    
     @Published var cryptos : [CoinResults] = []
    
    func feth() {
        
        guard let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json") else {
            print("Sictim url sikintili")
            return
        }
        
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error)")
            }
            guard let response = response as? HTTPURLResponse else {
                return
            }
            
            if response.statusCode == 200 {
                guard let data = data else {
                    print("DATADA SIKINTI VAR")
                    return
                }
                print("GIRDIM")
                do {
                    let decodedCryptos = try JSONDecoder().decode([CoinResults].self, from: data)
                    DispatchQueue.main.async {
                        for coin in decodedCryptos {
                            print(coin)
                            self.cryptos.append(coin)
                        }
                    }
                    print(decodedCryptos)
                    print(self.cryptos)
                } catch {
                    print(error)
                }
            }
            
            else {
                print("Response satus code :", response.statusCode)
            }
            
        }
        dataTask.resume()
    }
}
//        let task = URLSession.shared.dataTask(with: request as URLRequest) {  (data, response, error) in
//
//            if let httpResponse = response as? HTTPURLResponse {
//
//                print("error \(httpResponse.statusCode)")
//
//            //datayi alamiyor
//            guard let data = data else {
//
//                print("Error: \(error?.localizedDescription ?? "Unknown error")")
//
//                return
//
//            }
//
//            if let exchangeRate = try? JSONDecoder().decode(CoinResults.self, from: data) {
//                //TODO: CryptoService i optional yapip guard let self = self cak
//
//
//                    self.cryptos.append(exchangeRate)
//
//            } else {
//                print("Error: Invalid response format")
//            }
//            print(self.cryptos)
//        }
//    }
//        task.resume()
    

        
        //    func downloadMovies(page: Int, completion: @escaping ([CoinResults]?) -> ()){
        //        guard let url = URL(string: "asdasdasd") else {
        //            print("Sictim url sikintili")
        //            return
        //
        //        }
        //
        //        NetworkManager.shared.download(url: url) { [weak self] result in //MARK: MEMORY LEAK VE RETAIN CYCLE ENGELLEMEK ICIN WEAK SELF KULLANDIM
        //
        //            guard let self = self else {
        //
        //                return }
        //
        //            switch result {
        //            case .success(let data):
        //                completion(self.handleWithData(data))
        //                print(data)
        //            case .failure(let error):
        //                self.handleWithError(error)
        //            }
        //        }
        //    }
        //    private func handleWithError(_ error: Error) {
        //        print(error.localizedDescription)
        //    }
        //    private func handleWithData(_ data: Data) -> [CoinResults]? {
        //        do {
        //
        //            let coin = try JSONDecoder().decode(Coin.self, from: data) //MARK: Movie.self decodable'i isaret eder
        //
        //
        //            return coin.results
        //
        //        } catch {
        //            print(error)
        //            return nil
        //        }
        //    }
    //
    
    
