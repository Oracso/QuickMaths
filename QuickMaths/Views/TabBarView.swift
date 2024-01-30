//
//  TabBarView.swift
//  QuickMathsRemake
//
//  Created by Oscar Hardy on 29/01/2024.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            GameSelectionView()
                .tabItem {
                    Label("Games", systemImage: "gamecontroller")
                }
            
//            AllGameLogsView()
//                .tabItem {
//                    Label("Saved Logs", systemImage: "bookmark")
//                }
        }
    }
}

#Preview {
    TabBarView()
}
