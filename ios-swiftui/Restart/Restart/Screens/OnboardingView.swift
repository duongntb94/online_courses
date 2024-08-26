//
//  OnboardingView.swift
//  Restart
//
//  Created by Duong on 11/17/23.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    
    var body: some View {
        ZStack {
            Color.colorBlue
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: - Header
                Spacer()
                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60, weight: .heavy))
                    .foregroundStyle(.white)
                    Text("""
It's not how much we give but how much love we put into giving.
""")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
               
                // MARK: - Center
                ZStack {
                    CircleGroupView(shapeColor: .white, shapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: .zero)
                        .rotationEffect(.degrees(imageOffset.width / 20))
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                    }
                                    withAnimation(.easeOut(duration: 0.25)) {
                                        textTitle = "Give."
                                        indicatorOpacity = 0
                                    }
                                })
                                .onEnded({ _ in
                                    imageOffset = .zero
                                    withAnimation(.easeOut(duration: 0.25)) {
                                        textTitle = "Share."
                                        indicatorOpacity = 1
                                    }
                                })
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
                }
                .overlay(alignment: .bottom) {
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity)
                }
                
                Spacer()
                
                // MARK: - Footer
                ZStack {
                    // Part of the custom button.
                    // 1. Background (Static)
                    Capsule()
                        .fill(.white.opacity(0.2))
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    // 2. Call to action (static)
                    Text("Get started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    
                    // 3. Capsule (dynamic width)
                    HStack {
                        Capsule()
                            .foregroundStyle(.colorRed)
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    // 4. Circle (draggable)
                    HStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(.colorRed)
                            .frame(width: 80)
                            Circle()
                                .foregroundStyle(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                                .foregroundStyle(.white)
                        }
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged({ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }).onEnded({ _ in
                                    if buttonOffset > buttonWidth / 2 {
                                        buttonOffset = buttonWidth - 80
                                        withAnimation {
                                            isOnboardingViewActive = false
                                        }
                                    } else {
                                        buttonOffset = 0
                                    }
                                })
                        )
                        .onTapGesture {
                            isOnboardingViewActive = false
                        }
                        Spacer()
                    }
                }
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } // VStask
        } // ZStack
        .onAppear(perform: {
            isAnimating = true
        })
        .preferredColorScheme(.dark)
    }
}

#Preview {
    OnboardingView()
}
