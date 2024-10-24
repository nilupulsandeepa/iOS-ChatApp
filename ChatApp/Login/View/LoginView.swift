//
//  LoginView.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-24.
//

import SwiftUI

struct LoginView: View {
    @State var isSignInButtonAnimated: Bool = false
    @State var isSignInButtonInteractionEnabled: Bool = true
    
    var body: some View {
        VStack {
            Image("google")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
            Text("Sign With Google")
                .padding()
                .padding([.leading, .trailing], 20)
                .overlay {
                    RoundedRectangle(cornerRadius: .infinity).stroke(Color.primary, lineWidth: 2)
                }
                .scaleEffect(isSignInButtonAnimated ? 0.95 : 1.0)
                .animation(.easeInOut(duration: 0.15), value: isSignInButtonAnimated)
                .onTapGesture {
                    isSignInButtonInteractionEnabled = false
                    withAnimation {
                        isSignInButtonAnimated = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: {
                        withAnimation {
                            isSignInButtonAnimated = false
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.15, execute: {
                                print("Button Pressed")
                                isSignInButtonInteractionEnabled = true
                            })
                        }
                    })
                }
                .disabled(!isSignInButtonInteractionEnabled)
                .padding([.top], 40)
        }
    }
}

#Preview {
    LoginView()
}
