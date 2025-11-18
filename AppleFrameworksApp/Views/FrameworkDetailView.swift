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
    var framework: Framework
    
    var body: some View {
        VStack{
            DismissButton(isShowingDetailView: $isShowingDetailView)
            Spacer()
            FrameworkTitleView(framework: framework)
            Text(framework.description)
                .font(.body)
                .padding()
            Spacer()
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
        }
        .sheet(isPresented: $isShowingSafariView, content: {
            SafariView(url: URL(string: framework.urlString) ??
                       URL(string: "www.apple.com")!)
        })
    }
}

#Preview {
    FrameworkDetailView(isShowingDetailView: .constant(false), framework: MockData.samplePreviewFramework)
}
