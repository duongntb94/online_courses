//
//  SettingsView.swift
//  HikeApp
//
//  Created by Duong on 11/1/23.
//

import SwiftUI

struct SettingsView: View {
    var iconNames = ["Backpack", "Camera", "Campfire", "MagnifyingGlass", "Map", "Mushroom"]
    
    var body: some View {
        List {
            Section {
                // MARK: - Section header
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("DAN")
                            .font(.system(size: 66, weight: .black))
                        Text("Is so handsome")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors: [.colorGreenLight, .colorGreenMedium, .colorGreenDark], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better if you are actually there. The hike that you hope to do again in someday. \nFind the best days hike in the app.")
                        .font(.footnote)
                        .italic()
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
                
            }
            .listRowSeparator(.hidden)
            
            // MARK: - Section icon
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(iconNames.indices, id: \.self) { index in
                            let iconName = iconNames[index]
                            Button(action: {
                                UIApplication.shared.setAlternateIconName("AppIcon-\(iconName)")
                            }, label: {
                                Image("AppIcon-\(iconName)-Preview")
                                    .resizable()
                                    .frame(width: 80, height: 80)
                                    .scaledToFit()
                                    .cornerRadius(16)
                            })
                            
                        }
                    }
                    .frame(width: .infinity)
                }
            } header: {
                Text("ALTERNATIVE ICONS")
            }

            
            // MARK: - Section about
            Section {
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintColor: .red)
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintColor: .orange)
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPad OS", rowTintColor: .purple)
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .blue)
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Dan Ng", rowTintColor: .cyan)
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintColor: .mint, rowLinkLabel: "duongntb.github", rowLinkDestination: "https://duongntb94.github.io/")
            } header: {
                Text("About the app")
            } footer: {
                HStack {
                    Spacer()
                    Text("Copyright © All right reserved.")
                    Spacer()
                }
            }

        }
    }
}

#Preview {
    SettingsView()
}
