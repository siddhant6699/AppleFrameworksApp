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
            FrameworkReflectionTitleView(framework: framework)
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

struct FrameworkReflectionTitleView: View {
   
    let framework: Framework
    
    var body: some View {
        VStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .reflection(opacity: 0.3, spacing: 0)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}

struct ReflectionModifier: ViewModifier {
    var opacity: Double
    var spacing: CGFloat
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            content
            content
                .scaleEffect(-1)
                .mask(LinearGradient(gradient: Gradient(colors: [.black, .black.opacity(0)]),
                                     startPoint: .top,
                                     endPoint: .bottom))
                .mask(LinearGradient(gradient: Gradient(colors: [.black, .black.opacity(0)]),
                                     startPoint: .top,
                                     endPoint: .bottom))
                .opacity(opacity)
                .offset(y: spacing)
        }
    }
}

extension View {
    func reflection(opacity: Double, spacing: CGFloat) -> some View {
        self.modifier(ReflectionModifier(opacity: opacity, spacing: spacing))
    }
}
