//
//  ContentView.swift
//  Bankey-SwiftUI
//
//  Created by Mertcan Kırcı on 4.03.2023.
//

import SwiftUI

struct LoginView: View {
    
    @ObservedObject var viewModel = LoginVewModel()
    @State var username: String =  ""
    @State var password: String = ""
    @State var showingAlert: Bool = false
    @State private var isTrue : Bool = false
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    
    
    var body: some View {
        
        if isTrue {
            CryptoView()
        }
        else {
            
            NavigationView {
                
                VStack{
                    
                    ZStack {
                        
                        LinearGradient(
                            colors: [Color(hex: 0x22A39F), .black],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                        .ignoresSafeArea()
                        .navigationTitle("BANKEY")
                        
                        
                        VStack(alignment: .center) {
                            
                            Text("Kripto para takibi icin dogru adres , BANKEY !")
                                .font(.headline)
                                .foregroundColor(Color(hex: 0xF3EFE0))
                                .padding(.top, 50)
                            Spacer()
                            
                            AsyncImage(url: URL(string: imageURL)) { image in
                                image
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 120 , height: 120)
                                
                            } placeholder: {
                                Image(systemName: "photo.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 120)
                                    .foregroundColor(Color(hex:0xF3EFE0))
                                    .padding(40)
                            }
                            
                            .padding()
                            
                            //MARK: Placeholder should dissapear when user clicks on field(Look up to View +Ext)
                            TextField("Username", text: $username)
                                .multilineTextAlignment(TextAlignment.center)
                                .frame(width: 200, height: 30)
                                .background(Color(hex: 0xF3EFE0))
                                .foregroundColor(Color(hex: 0x22A39F))
                                .cornerRadius(8)
                            
                            SecureField("Password", text: $password)
                                .multilineTextAlignment(TextAlignment.center)
                                .frame(width: 200, height: 30)
                                .background(Color(hex: 0xF3EFE0))
                                .foregroundColor(Color(hex: 0x22A39F))
                                .cornerRadius(8)
                            
                            
                                .padding(8)
                            
                            Button("Login") {
                                
                                
                                print("\(viewModel.users)")
                                
                                if viewModel.login(username: username, password: password)! {
                                    //MARK: NAVIGATE CRYPTO VIEW
                                    isTrue.toggle()
                                    CryptoView()
                                        .environmentObject(NetworkService())
                                }
                                else {
                                    showingAlert = true
                                    print("\(username) \(password)")
                                }
                            }
                            .fullScreenCover(isPresented: $isTrue, content: CryptoView.init)
                            .alert("Lutfen giris bilgilerinizi kontrol edin ! ", isPresented: $showingAlert, actions: {
                                Button("Ok", role: .cancel) {}
                            })
                            .frame(width: 80, height: 50)
                            .background(Color(hex: 0x22A39F))
                            .foregroundColor(Color(hex:0x434242))
                            .cornerRadius(16)
                            
                            
                            DividerView(label: "OR")
                            
                            NavigationLink(destination: SignUpView()) {
                                Text("Sign Up")
                                    .frame(width: 80, height: 50)
                                    .background(Color(hex: 0x22A39F))
                                    .foregroundColor(Color(hex: 0x434242))
                                    .cornerRadius(16)
                            }
                            Spacer()
                        }
                    }
                }
            }
            
            //MARK: LOAD USERS EVERY TIME SCREEN REFRESHES
        }
    }
        
}

struct LoginView_Pewviews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
