//
//  IconButtonView.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-26.
//

import SwiftUI

struct IconButtonView: View {
    
    var sytemName: String
    var onTapGesture: () -> Void
    
    @State private var isIconAnimated: Bool = false
    @State private var isIconEnabled: Bool = true
    
    var body: some View {
        Image(systemName: sytemName)
            .resizable()
            .scaledToFit()
            .frame(height: 32)
            .scaleEffect(isIconAnimated ? 0.925 : 1.0)
            .animation(.easeInOut(duration: 0.15), value: isIconAnimated)
            .onTapGesture {
                isIconEnabled = false
                withAnimation {
                    isIconAnimated = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    withAnimation {
                        isIconAnimated = false
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                        onTapGesture()
                        isIconEnabled = true
                    }
                }
            }
            .disabled(!isIconEnabled)
    }
}

#Preview {
    IconButtonView(sytemName: "plus.message.fill", onTapGesture: {})
}
