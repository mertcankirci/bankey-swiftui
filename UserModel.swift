//
//  UserModel.swift
//  Bankey-SwiftUI
//
//  Created by Mertcan Kırcı on 4.03.2023.
//

import SwiftUI

struct User: Identifiable {
    var id = UUID()
    var userName : String
    var password : String
    var email : String
}


