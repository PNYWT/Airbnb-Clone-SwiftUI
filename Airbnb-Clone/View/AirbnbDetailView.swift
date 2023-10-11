//
//  AirbnbDetailView.swift
//  Airbnb-Clone
//
//  Created by CallmeOni on 11/10/2566 BE.
//

import SwiftUI

struct AirbnbDetailView: View {
    
    let model:AirbnbListing
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { proxy in
                ScrollView(.vertical, showsIndicators: true){
                    //Picture
                    AsyncImage(url: URL(string: model.thumbnail_url ?? "")) { image in
                        image.resizable().aspectRatio(contentMode: .fill).clipped()
                    } placeholder: {
                        Color.red
                            .overlay(
                                ProgressView()
                                    .progressViewStyle(.circular)
                                    .tint(.white)
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                            )
                    }
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
                    
                    //info
                    Text(String(format: "Name: %@", model.name))
                        .bold()
                        .padding()
                    
                    Text(String(format: "Nightly Rate: %@", model.price.formatted(.currency(code: "USD"))))
                    
                    Text(String(format: "Description: %@", model.description))
                        .padding()
                    Text(String(format: "Summary: %@", model.summary ?? "-"))
                        .padding()
                    Text(String(format: "Rules: %@", model.house_rules ?? "-"))
                        .padding()
                    Text(String(format: "Space: %@", model.space ?? "-"))
                        .padding()
                    
                    //Host Info
                    Text("About your host")
                        .bold().font(.title2)
                    
                    HStack{
                        AsyncImage(url: URL(string: model.host_thumbnail_url)) { image in
                            image.resizable().aspectRatio(contentMode: .fit)
                        } placeholder: {
                            Color.red
                                .overlay(
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                        .tint(.white)
                                        .frame(width: 75, height: 75)
                                )
                        }
                        .frame(width: 75,height: 75)
                        .clipShape(Circle())
                        
                        Text(String(format: "Host name: %@", model.host_name))
                            .bold()
                    }
                    .padding()
                    
                    Text(String(format: "Hosting since: %@", model.host_since ))
                }
                .frame(width: proxy.frame(in: .global).width)
//                .navigationBarTitle("Overview", displayMode: .automatic)
                .navigationTitle(model.name)
            }
        }
    }
}
