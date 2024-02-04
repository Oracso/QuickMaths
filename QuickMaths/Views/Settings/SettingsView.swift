//
//  SettingsView.swift
//  QuickMaths
//
//  Created by Oscar Hardy on 31/01/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        List {
            NavigationLink("Download Data") {
                DataDownloadView()
            }
        }
        .navigationTitle("Settings")
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
