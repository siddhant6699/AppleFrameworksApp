//
//  FrameworkGridViewModel.swift
//  AppleFrameworksApp
//
//  Created by Siddhant Chouhan on 14/11/25.
//

import SwiftUI
import Combine

final class FrameworkGridViewModel: ObservableObject {
    
    @Published var selectedFramework: Framework? {
        didSet {
            isShowingDetailView = true
        }
    }
    
    @Published var isShowingDetailView = false
    
}
