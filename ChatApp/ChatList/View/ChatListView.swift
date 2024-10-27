//
//  ChatListView.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-24.
//

import SwiftUI

struct ChatListView: View {
    
    @EnvironmentObject var appSession: SessionViewModel
    
    @State private var linkShareSheetPresented: Bool = false
    
    var body: some View {
        ZStack {
            if let user = appSession.user {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Image(systemName: "envelope.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                        Text("Messages")
                            .font(.largeTitle)
                            .padding([.leading], 12)
                        Spacer()
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 24)
                    }
                    HStack(alignment: .center) {
                        IconButtonView(
                            sytemName: "person.crop.circle.fill.badge.plus",
                            onTapGesture: {
                                print("Button Pressed")
                                linkShareSheetPresented = true
                            })
                        .sheet(isPresented: $linkShareSheetPresented, content: {
                            ShareSheet(items: ["Hello! Add me as your friend!", URL(string: "https://www.google.com")!])
                        })
                        Spacer()
                        Text("Nilupul Sandeepa")
                            .font(.system(size: 24))
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                AuthenticationManager.shared.signOutGoogleSignIn()
                            }
                        Spacer()
                        IconButtonView(
                            sytemName: "square.and.pencil.circle.fill",
                            onTapGesture: {
                                
                            })
                    }
                    ScrollView(.vertical, showsIndicators: false) {
                        LazyVGrid(columns: [GridItem()]) {
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                            ChatListItem()
                        }
                    }
                }
                .padding([.leading, .trailing], 24)
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ChatListView()
}

import SwiftUI
import UIKit

struct ShareSheet: UIViewControllerRepresentable {
    let items: [Any] // Content to share
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let ss = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return ss
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}
