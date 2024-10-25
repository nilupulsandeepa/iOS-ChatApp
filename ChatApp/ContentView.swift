//
//  ContentView.swift
//  ChatApp
//
//  Created by Nilupul Sandeepa on 2024-10-23.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        NavigationStack {
            ChatListView()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(SessionViewModel())
}
