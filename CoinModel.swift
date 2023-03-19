//
//  CoinModel.swift
//  Bankey-SwiftUI
//
//  Created by Mertcan Kırcı on 8.03.2023.
//

import SwiftUI




struct CoinResults :  Codable, Hashable, Identifiable {
    //MARK: UUID random id vermiyor bundan dolayi listeleyemiyorum
    let id = UUID().uuidString
    var currency : String
    var price: String
}
