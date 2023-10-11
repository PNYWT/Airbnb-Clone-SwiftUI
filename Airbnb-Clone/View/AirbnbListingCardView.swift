//
//  AirbnbListingCardView.swift
//  Airbnb-Clone
//
//  Created by CallmeOni on 11/10/2566 BE.
//

import SwiftUI

struct AirbnbListingCardView: View {
    let model: AirbnbListing
    
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: model.thumbnail_url ?? "")) { image in
                image.resizable().aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.red
                    .overlay(
                        ProgressView()
                            .progressViewStyle(.circular)
                            .tint(.white)
                            .frame(width: 125, height: 100)
                    )
            }
            .frame(width: 125,height: 100)
            .cornerRadius(16)
            
            
            VStack{
                Text(model.name)
                    .lineLimit(1)
                    .font(.title3)
                    .bold()
                Text(model.description)
                    .lineLimit(3)
                    .foregroundColor(.secondary)
                    .font(.body)
            }
        }
    }
}

//struct AirbnbListingCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        AirbnbListingCardView(model: nil)
//    }
//}
