//
//  ChatListItem.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-24.
//

import SwiftUI

struct ChatListItem: View {
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(height: 50)
            VStack(alignment: .leading) {
                Text("John Doe")
                    .font(.headline)
                    .fontWeight(.semibold)
                Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem")
                    .lineLimit(1)
                    .font(.subheadline)
            }
        }
        .padding([.top, .bottom], 12)
    }
}

#Preview {
    ChatListItem()
}
