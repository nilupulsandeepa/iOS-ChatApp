//
//  ChatListView.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-24.
//

import SwiftUI

struct ChatListView: View {
    
    @EnvironmentObject var appSession: SessionViewModel
    
    var body: some View {
        ZStack {
//            if let user = appSession.user {
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
//            } else {
//                LoginView()
//                    .onTapGesture {
//                        appSession.user = User()
//                    }
//            }
        }
    }
}

#Preview {
    ChatListView()
}
