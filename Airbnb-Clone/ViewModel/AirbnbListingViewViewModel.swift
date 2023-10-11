//
//  AirbnbListingViewViewModel.swift
//  Airbnb-Clone
//
//  Created by CallmeOni on 11/10/2566 BE.
//

import Foundation

final class AirbnbListingViewViewModel: ObservableObject {
    private let service = APIService()
    
    @Published var listings:[AirbnbListing] = []
    
    public func fetchListings(){
        service.getListings { [weak self] result in
            switch result{
            case .success(let model):
                print("Have Data")
                self?.listings = model
                break
            case .failure(let error):
                print("fetchListings Error -> \(error)")
                break
            }
        }
    }
}
