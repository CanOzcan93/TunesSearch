//
//  Item.swift
//  TunesSearch
//
//  Created by Can Özcan on 11.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit
import CryptoKit

public class Item: Codable {
    
    public var wrapperType: String
    public var kind: String?
    public var artistId: UInt?
    public var amgArtistId: UInt?
    public var collectionId: UInt?
    public var trackId: UInt?
    public var name: String
    public var creator: String
    public var pictureUrl: String
    public var currency: String
    public var price: Double
    public var description: String?
    public var hashID: String = ""
    
    public var picture: UIImage?
    
    public enum CodingKeys: String, CodingKey {
        
        case results
        case wrapperType
        case kind
        case artistId
        case amgArtistId
        case collectionId
        case trackId
        case artistName
        case collectionName
        case trackName
        case collectionCensoredName
        case trackCensoredName
        case artistViewUrl
        case collectionViewUrl
        case feedUrl
        case trackViewUrl
        case previewUrl
        case artworkUrl30
        case artworkUrl60
        case artworkUrl100
        case collectionPrice
        case collectionHdPrice
        case trackPrice
        case trackRentalPrice
        case trackHdPrice
        case trackHdRentalPrice
        case releaseDate
        case collectionExplicitness
        case trackExplicitness
        case discCount
        case discNumber
        case trackCount
        case trackNumber
        case trackTimeMillis
        case country
        case currency
        case primaryGenreName
        case copyright
        case shortDescription
        case longDescription
        case description
        case contentAdvisoryRating
        
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        wrapperType = try container.decode(String.self, forKey: .wrapperType)
        kind = try container.decodeIfPresent(String.self, forKey: .kind)
        artistId = try container.decodeIfPresent(UInt.self, forKey: .artistId)
        amgArtistId = try container.decodeIfPresent(UInt.self, forKey: .amgArtistId)
        collectionId = try container.decodeIfPresent(UInt.self, forKey: .collectionId)
        trackId = try container.decodeIfPresent(UInt.self, forKey: .trackId)
        
        let tempName = try container.decodeIfPresent(String.self, forKey: .trackName)
        if tempName == nil {
            name = try container.decode(String.self, forKey: .collectionName)
        } else { name = tempName! }
        
        creator = try container.decode(String.self, forKey: .artistName)
        
        var tempPicUrl = try container.decodeIfPresent(String.self, forKey: .artworkUrl100)
        if tempPicUrl == nil {
            tempPicUrl = try container.decodeIfPresent(String.self, forKey: .artworkUrl60)
            if tempPicUrl == nil {
                pictureUrl = try container.decode(String.self, forKey: .artworkUrl30)
            }
            else { pictureUrl = tempPicUrl! }
        } else { pictureUrl = tempPicUrl! }
        
        currency = try container.decode(String.self, forKey: .currency)
        var tempPrice = try container.decodeIfPresent(Double.self, forKey: .trackPrice)
        if tempPrice == nil {
            tempPrice = try container.decodeIfPresent(Double.self, forKey: .collectionPrice)
            if tempPrice == nil {
                price = .nan
            } else { price = tempPrice!}
        } else { price = tempPrice! }
        
        var tempDescription = try container.decodeIfPresent(String.self, forKey: .longDescription)
        if tempDescription == nil {
            tempDescription = try container.decodeIfPresent(String.self, forKey: .shortDescription)
            if tempDescription == nil {
                description = try container.decodeIfPresent(String.self, forKey: .description)
            }
            else { description = tempDescription }
        } else { description = tempDescription }
        
        UIImage.load(from: URL(string: pictureUrl)!) { (result) in
            switch result {
            case .success(let img):
                self.picture = img
            case .failure(let err):
                break
            }
        }
        
        if trackId != nil {
            hashID += "\(trackId!)"
        } else {
            hashID += "None"
        }
        if collectionId != nil {
            hashID += "\(collectionId!)"
        } else {
            hashID += "None"
        }
        if artistId != nil {
            hashID += "\(artistId!)"
        } else {
            hashID += "None"
        }
        if amgArtistId != nil {
            hashID += "\(amgArtistId!)"
        } else {
            hashID += "None"
        }
        
        hashID = hashID.MD5
        
        
    }
    
    public func encode(to encoder: Encoder) throws {
        
    }
    
}
