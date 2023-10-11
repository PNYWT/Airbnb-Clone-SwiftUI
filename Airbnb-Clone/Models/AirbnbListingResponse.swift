//
//  AirbnbListingResponse.swift
//  Airbnb-Clone
//
//  Created by CallmeOni on 11/10/2566 BE.
//

import Foundation

struct AirbnbListingResponse:Codable{
    let total_count:Int
    let results:[AirbnbListing]
}

struct AirbnbListing:Codable, Hashable, Identifiable{
    let id:String
    let listing_url:String
    let scrape_id:String
    let last_scraped:String
    let name:String
    let summary:String?
    let space:String?
    let description:String
    let house_rules:String?
    let thumbnail_url:String?
    let xl_picture_url:String?
    let neighbourhood:String?
    let amenities:[String]
    let price:Int
    
    //Host Details
    let host_name:String
    let host_since:String
    let host_thumbnail_url:String
    let host_picture_url:String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.listing_url = try container.decode(String.self, forKey: .listing_url)
        self.scrape_id = try container.decode(String.self, forKey: .scrape_id)
        self.last_scraped = try container.decode(String.self, forKey: .last_scraped)
        self.name = try container.decode(String.self, forKey: .name)
        self.summary = try container.decodeIfPresent(String.self, forKey: .summary)
        self.space = try container.decodeIfPresent(String.self, forKey: .space)
        self.description = try container.decode(String.self, forKey: .description)
        self.house_rules = try container.decodeIfPresent(String.self, forKey: .house_rules)
        self.thumbnail_url = try container.decodeIfPresent(String.self, forKey: .thumbnail_url)
        self.xl_picture_url = try container.decodeIfPresent(String.self, forKey: .xl_picture_url)
        self.neighbourhood = try container.decodeIfPresent(String.self, forKey: .neighbourhood)
        self.amenities = try container.decode([String].self, forKey: .amenities)
        self.price = try container.decode(Int.self, forKey: .price)
        self.host_name = try container.decode(String.self, forKey: .host_name)
        self.host_since = try container.decode(String.self, forKey: .host_since)
        self.host_thumbnail_url = try container.decode(String.self, forKey: .host_thumbnail_url)
        self.host_picture_url = try container.decode(String.self, forKey: .host_picture_url)
    }
}
