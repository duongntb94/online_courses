//
//  ContentView.swift
//  Pinch
//
//  Created by Duong on 1/24/24.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false
    @State private var currentPageIndex = 0
    
    // MARK: - Function
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    // MARK: - Content
    var body: some View {
        NavigationStack {
            // MARK: - Page image
            ZStack {
                Color.clear
                Image(pageData[currentPageIndex].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2)
                .opacity(isAnimating ? 1 : 0)
                .scaleEffect(imageScale)
                .offset(imageOffset)
                // MARK: - 1. Tap gesture
                .onTapGesture(count: 2) {
                    if imageScale == 1 {
                        withAnimation(.spring()) {
                            imageScale = 5
                        }
                    } else {
                        resetImageState()
                    }
                }
                // MARK: - 2. Drag offset
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            withAnimation(.linear(duration: 1)) {
                                imageOffset = value.translation
                            }
                        })
                        .onEnded({ _ in
                            if imageScale <= 1 {
                                resetImageState()
                            }
                        })
                )
                // MARK: - 3. Magnify gesture
                .gesture(
                    MagnificationGesture()
                        .onChanged({ value in
                            withAnimation(.linear(duration: 1)) {
                                if imageScale >= 1 && imageScale <= 5 {
                                    imageScale = value
                                } else if imageScale > 5 {
                                    imageScale = 5
                                }
                            }
                        })
                        .onEnded({ _ in
                            if imageScale > 5 {
                                imageScale = 5
                            } else if imageScale < 1 {
                                resetImageState()
                            }
                        })
                )
            }.navigationTitle("Pinch & Zoom")
                .navigationBarTitleDisplayMode(.inline)
                .onAppear(perform: {
                    withAnimation(.linear(duration: 1)) {
                        isAnimating = true
                    }
                })
                // MARK: - Info view
                .overlay(alignment: .top) {
                    InfoPanelView(scale: imageScale, offset: imageOffset)
                        .padding(.horizontal)
                        .padding(.top, 30)
                }
                // MARK: Magnify control
                .overlay(alignment: .bottom) {
                    Group {
                      HStack {
                        // SCALE DOWN
                        Button {
                          withAnimation(.spring()) {
                            if imageScale > 1 {
                              imageScale -= 1
                              
                              if imageScale <= 1 {
                                resetImageState()
                              }
                            }
                          }
                        } label: {
                          ControlImageView(imageName: "minus.magnifyingglass")
                        }
                        
                        // RESET
                        Button {
                          resetImageState()
                        } label: {
                          ControlImageView(imageName: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        // SCALE UP
                        Button {
                          withAnimation(.spring()) {
                            if imageScale < 5 {
                              imageScale += 1
                              
                              if imageScale > 5 {
                                imageScale = 5
                              }
                            }
                          }
                        } label: {
                          ControlImageView(imageName: "plus.magnifyingglass")
                        }
                        
                      } //: CONTROLS
                      .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                      .background(.ultraThinMaterial)
                      .cornerRadius(12)
                      .opacity(isAnimating ? 1 : 0)
                    }
                      .padding(.bottom, 30)
                }
                // MARK: - Drawer
                .overlay(alignment: .topTrailing) {
                    HStack(spacing: 20) {
                        Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 40)
                            .padding(8)
                            .foregroundColor(.secondary)
                            .onTapGesture {
                                withAnimation(.spring) {
                                    isDrawerOpen.toggle()
                                }
                            }
                        
                        ForEach(pageData) { page in
                            Image(page.thumbnailName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                                .onTapGesture {
                                    isAnimating = true
                                    currentPageIndex = page.id
                                }
                                
                        }
                        Spacer()
                    }
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                }
        } // NAVIGATION
        
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
        .previewDevice("iPhone 15")
}
