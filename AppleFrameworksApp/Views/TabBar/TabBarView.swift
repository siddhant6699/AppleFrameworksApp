//
//  TabView.swift
//  AppleFrameworksApp
//
//  Created by Siddhant Chouhan on 19/11/25.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            FrameworkGridView()
                .tabItem{
                    Label("GridView", systemImage: "square.grid.3x3")
                        .font(.largeTitle)
                }
            FrameworkListView(isFromListView: true)
                .tabItem{
                    Label("ListView", systemImage: "list.dash")
                }
        }
    }
}

#Preview {
    TabBarView()
}
