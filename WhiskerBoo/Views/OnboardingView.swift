//
//  OnboardingView.swift
//  WhiskerBoo
//
//  Created by Lovice Sunuwar on 05/03/2025.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - PROPERTY
    @ObservedObject var viewModel = OnboardingVM()
    @State private var currentIndex = 0
    private let autoScrollInterval: TimeInterval = 1.5
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $currentIndex) {
                
                ForEach(0..<viewModel.onboardingItems.count + 1, id: \.self) { index in
                    let actualIndex = index % viewModel.onboardingItems.count
                    
                    ZStack {
                        Image(viewModel.onboardingItems[actualIndex].imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.5, alignment: .top)
                            .clipped()
                            .ignoresSafeArea(edges: .top)
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: UIScreen.main.bounds.height / 1.5, alignment: .top)
            .onChange(of: currentIndex) { oldValue, newValue in
                
                if newValue == viewModel.onboardingItems.count {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(nil) {
                            currentIndex = 0
                        }
                    }
                }
            }
            .task {
                await autoSlide()
            }
            
            VStack(spacing: 0) {
                Text(NSLocalizedString("onboarding_title", comment: "Onboarding Title"))
                    .fontWeight(.bold)
                    .font(.system(size: 24))
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 40)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.8)
                
                Text(NSLocalizedString("onboarding_body", comment: "Onboarding Body Text"))
                    .frame(width: UIScreen.main.bounds.width * 0.9, height: 80)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                    .minimumScaleFactor(0.8)
                
                Button(action: {
                    print("Yeai!! ")
                })
                {
                    Text("Get Started")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width * 0.5)
                        .padding()
                        .background(Color.secondaryColor)
                        .cornerRadius(20)
                    
                }
            }
            .offset(y: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea(edges: .top)
    }
    
    private func autoSlide() async {
        while true {
            try? await Task.sleep(nanoseconds: UInt64(autoScrollInterval * 1_000_000_000))
            await MainActor.run {
                withAnimation(.easeInOut(duration: 1.2)) { // Smooth transition effect
                    if currentIndex == viewModel.onboardingItems.count {
                        withAnimation(nil) { // Instantly reset without flicker
                            currentIndex = 0
                        }
                    } else {
                        currentIndex += 1
                    }
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
