//
//  AirbnbListingView.swift
//  Airbnb-Clone
//
//  Created by CallmeOni on 11/10/2566 BE.
//

import SwiftUI

struct AirbnbListingView:View{
    @ObservedObject var viewModel = AirbnbListingViewViewModel()
    
    var body: some View{
        NavigationView {
            VStack{
                if viewModel.listings.isEmpty{
                    ProgressView()
                        .progressViewStyle(.circular)
                }else{
                    List(viewModel.listings) { item in
                        NavigationLink(destination: AirbnbDetailView(model: item)) {
                            AirbnbListingCardView(model: item)
                        }
                    }
                    .navigationTitle("Airbnb")
                }
            }
        }
        .onAppear{
            viewModel.fetchListings()
        }
    }
}

struct AirBnbListingView_Preview: PreviewProvider {
    static var previews: some View {
        AirbnbListingView()
    }
}
