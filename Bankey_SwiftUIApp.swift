//
//  Bankey_SwiftUIApp.swift
//  Bankey-SwiftUI
//
//  Created by Mertcan Kırcı on 4.03.2023.
//

import SwiftUI

@main
struct Bankey_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
                .environmentObject(NetworkService())
        }
        
    }
    
}
