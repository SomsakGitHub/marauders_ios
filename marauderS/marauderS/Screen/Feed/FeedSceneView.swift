//
//  FeedSceneView.swift
//  marauderS
//
//  Created by somsak on 30/4/2568 BE.
//

import SwiftUI

struct FeedSceneView: View {
    
    @State var top = 0
    @State private var isLocalVideoShowing = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VTabView().padding(.top, -200)
            }
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
                    .buttonStyle(.plain)
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button {
                        
                    } label: {
                        VStack {
                            Image(systemName:  "house.fill")
                            Text("Home")
                                .font(.caption)
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        VStack {
                            Image(systemName:  "person.2")
                            Text("Friends")
                                .font(.caption)
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    Button {
                        isLocalVideoShowing.toggle()
                    } label: {
                        Image(systemName: "plus.rectangle.fill")
                    }
                    .font(.title3)
                    .buttonStyle(.plain)
                    .foregroundStyle(.black)
                    .padding(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 2))
                    .background(LinearGradient(gradient: Gradient(colors: [.teal, .red]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(6)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        VStack {
                            Image(systemName:  "tray")
                            Text("Inbox")
                                .font(.caption)
                        }
                    }
                    .buttonStyle(.plain)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        VStack {
                            Image(systemName:  "person")
                            Text("Profile")
                                .font(.caption)
                        }
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    FeedSceneView()
}
