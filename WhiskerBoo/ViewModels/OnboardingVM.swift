//
//  OnboardingVM.swift
//  WhiskerBoo
//
//  Created by Lovice Sunuwar on 05/03/2025.
//

import Foundation

class OnboardingVM: ObservableObject {
    @Published var onboardingItems: [OnboardingModel] = [
        OnboardingModel(id: UUID(), imageName: "OB2"),
        OnboardingModel(id: UUID(), imageName: "OB3"),
        OnboardingModel(id: UUID(), imageName: "OB4"),
        OnboardingModel(id: UUID(), imageName: "OB9"),
        OnboardingModel(id: UUID(), imageName: "OB8"),
        OnboardingModel(id: UUID(), imageName: "OB7")
    ]
}
