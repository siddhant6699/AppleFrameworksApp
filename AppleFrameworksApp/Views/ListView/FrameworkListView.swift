//
//  FrameworkListView.swift
//  AppleFrameworksApp
//
//  Created by Siddhant Chouhan on 19/11/25.
//

import SwiftUI

struct FrameworkListView: View {
    
    @StateObject var viewModel = FrameworkGridViewModel()
    @State var isFromListView: Bool
    
    var body: some View {
        NavigationView{
            List {
                ForEach(MockData.frameworks) {framework in
                    NavigationLink(destination: FrameworkDetailView(
                                        isShowingDetailView: $viewModel.isShowingDetailView,
                                        isFromListView: isFromListView,
                                        framework: framework)){
                                            FrameworkCellView(framework: framework)
                                        }
                }
            }
            .navigationTitle("🍎 Frameworks")
        }
    }
}

#Preview {
    FrameworkListView(isFromListView: false)
}

struct FrameworkCellView: View {
    
    let framework: Framework
    
    var body: some View {
        HStack {
            Image(framework.imageName)
                .resizable()
                .frame(width: 55, height: 55)
            Text(framework.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
    }
}
