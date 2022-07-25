//
//  Brewery.swift
//  Breweries
//
//  Created by admin on 7/25/22.
//

import Foundation


struct Brewery: Hashable, Codable {
    let id: String
    let name: String
    let breweryType: String
    let street: String?
    let address2: String?
    let address3: String?
    let city: String?
    let state: String
    let countryProvince: String?
    let postalCode: String
    let country: String
    let longitude: String?
    let latitude: String?
    let phone: String?
    let websiteUrl: String?
    let updatedAt: String
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case breweryType = "brewery_type"
        case address2 = "address_2"
        case address3 = "address_3"
        case countryProvince = "country_province"
        case postalCode = "postal_code"
        case websiteUrl = "website_url"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id, name, street, city, state, country, longitude, latitude, phone
    }
  
}

