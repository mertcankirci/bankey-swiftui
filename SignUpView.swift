//
//  SignUpView.swift
//  Bankey-SwiftUI
//
//  Created by Mertcan Kırcı on 4.03.2023.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = LoginVewModel()
    @State var username : String = ""
    @State var password : String = ""
    @State var password2 : String = ""
    @State var showingAlert : Bool = false
    @State var email : String = ""
    @State var name : String = ""
    private let imageURL: String = "https://credo.academy/credo-academy@3x.png"
    
    var body: some View {
        NavigationView {
            VStack{
                ZStack {
                    LinearGradient(
                        colors: [Color(hex: 0x22A39F), .black],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .ignoresSafeArea()
                    
                    
                    VStack(alignment: .center, spacing: 8){
                        
                        
                        
                        Text("SIGN UP TO BANKEY")
                            .frame(width: 400, height: 100)
                            .multilineTextAlignment(.center)
                            .font(.largeTitle)
                            .foregroundColor(Color(hex:0xF3EFE0))
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
                        
                        Spacer()
                        
                        TextField("E-mail", text: $email)
                            .multilineTextAlignment(TextAlignment.center)
                            .frame(width: 250, height: 30)
                            .background(Color(hex: 0xF3EFE0))
                            .foregroundColor(Color(hex: 0x22A39F))
                            .cornerRadius(8)
                        
                            .padding()
                        
                        HStack(spacing: 8) {
                            TextField("Name", text: $name)
                                .multilineTextAlignment(TextAlignment.center)
                                .frame(width: 150, height: 30)
                                .background(Color(hex: 0xF3EFE0))
                                .foregroundColor(Color(hex: 0x22A39F))
                                .cornerRadius(8)
                            
                                
                            
                            TextField("Username", text: $username)
                                .multilineTextAlignment(TextAlignment.center)
                                .frame(width: 150, height: 30)
                                .background(Color(hex: 0xF3EFE0))
                                .foregroundColor(Color(hex: 0x22A39F))
                                .cornerRadius(8)
                        }
                        
                        HStack {
                            
                            TextField("Password", text: $password)
                                .multilineTextAlignment(TextAlignment.center)
                                .frame(width: 150, height: 30)
                                .background(Color(hex: 0xF3EFE0))
                                .foregroundColor(Color(hex: 0x22A39F))
                                .cornerRadius(8)
                            
                            TextField("Password Tekrar", text: $password2)
                                .multilineTextAlignment(TextAlignment.center)
                                .frame(width: 150, height: 30)
                                .background(Color(hex: 0xF3EFE0))
                                .foregroundColor(Color(hex: 0x22A39F))
                                .cornerRadius(8)
                        }
                        
                        Spacer()
                        
                        Button("Signup") {
                            if viewModel.signUp(username: username, password: password, password2: password2, email: email) {
                                showingAlert = true
                            }
                            else {
                                print("sikinti")
                            }
                        }
                        .frame(width: 80, height: 50)
                        .background(Color(hex: 0x22A39F))
                        .foregroundColor(Color(hex:0x434242))
                        .cornerRadius(16)
                        .alert("Basariyla kaydoldunuz tebrikler ! ", isPresented: $showingAlert, actions: {
                            Button("Ok") {
                                dismiss()
                            }
                        })
                        
                        .padding(.bottom, 150)
                        
                        
                        
                    }
                }
                
                
            }
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
