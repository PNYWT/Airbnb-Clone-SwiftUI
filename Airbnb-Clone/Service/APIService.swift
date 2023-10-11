//
//  APIService.swift
//  Airbnb-Clone
//
//  Created by CallmeOni on 11/10/2566 BE.
//

import Foundation

struct Constants{
    static let apiURL = URL(string: "https://public.opendatasoft.com/api/explore/v2.1/catalog/datasets/airbnb-listings/records?limit=20&refine=city%3ANew%20York&refine=room_type%3AEntire%20home%2Fapt")
}

final class APIService{
    
    public func getListings(completion:@escaping(Result<[AirbnbListing], Error>)->Void){
        guard let urlPath = Constants.apiURL else{
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: urlPath)) { dataReturn, _, error in
            guard let data = dataReturn, error == nil else{
                if let error{
                    completion(.failure(error))
                }
                return
            }
            
            do{
                let response = try JSONDecoder().decode(AirbnbListingResponse.self, from: data)
                completion(.success(response.results))
            }catch{
                let json = try? JSONSerialization.jsonObject(with: data)
                print("json failure -> \(String(describing: json))")
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
