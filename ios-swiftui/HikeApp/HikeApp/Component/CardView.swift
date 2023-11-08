//
//  CardView.swift
//  HikeApp
//
//  Created by Duong on 10/18/23.
//

import SwiftUI

struct CardView: View {
    @State var randomNumber = 0
    @State var imageNumber = 0
    @State var isShowingView = false
    
    func createRandomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                VStack {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(LinearGradient(colors: [.colorGrayLight, .colorGrayMedium], startPoint: .top, endPoint: .bottom))
                        Spacer()
                        Button(action: {
                            isShowingView.toggle()
                        }, label: {
                            CustomButtonView()
                        })
                        .sheet(isPresented: $isShowingView, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and family")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.colorGrayMedium)
                }
                .padding(.horizontal, 30)
                
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                
                Button(action: {
                    createRandomImage()
                }, label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.colorGreenLight, .colorGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                    
                })
                .buttonStyle(GradientButton())
            }
        }.frame(width: 320, height: 570)
            .onAppear(perform: {
                createRandomImage()
            })
    }
}

#Preview {
    CardView()
}
