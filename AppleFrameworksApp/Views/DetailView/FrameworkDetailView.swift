//
//  FrameworkDetailView.swift
//  AppleFrameworksApp
//
//  Created by Siddhant Chouhan on 13/11/25.
//

import SwiftUI

struct FrameworkDetailView: View {
    
    @Binding var isShowingDetailView: Bool
    @State private var isShowingSafariView = false
    @State var isFromListView: Bool
    var framework: Framework
    
    var body: some View {
        VStack{
            if !isFromListView{
                DismissButton(isShowingDetailView: $isShowingDetailView)
            }
            if !isFromListView{
                Spacer()
            }
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            if !isFromListView{
                Spacer()
            }
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .sheet(isPresented: $isShowingSafariView,
               content: { SafariView(url: URL(string: framework.urlString) ??
                       URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(isShowingDetailView: .constant(false),
                        isFromListView: false,
                        framework: MockData.samplePreviewFramework)
}
