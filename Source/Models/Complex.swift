//
//  Complex.swift
//  TunesSearch
//
//  Created by Can Özcan on 12.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

public struct Complex: Codable {
    
    public var wrapperType: String
    public var kind: String?
    public var artistId: UInt?
    public var amgArtistId: UInt?
    public var collectionId: UInt?
    public var trackId: UInt?
    public var artistName: String?
    public var collectionName: String?
    public var trackName: String?
    public var collectionCensoredName: String?
    public var trackCensoredName: String?
    public var artistViewUrl: String?
    public var collectionViewUrl: String?
    public var feedUrl: String?
    public var trackViewUrl: String?
    public var previewUrl: String?
    public var artworkUrl30: String?
    public var artworkUrl60: String?
    public var artworkUrl100: String?
    public var collectionPrice: Double?
    public var collectionHdPrice: Double?
    public var trackPrice: Double?
    public var trackRentalPrice: Double?
    public var trackHdPrice: Double?
    public var trackHdRentalPrice: Double?
    public var releaseDate: String?
    public var collectionExplicitness: String?
    public var trackExplicitness: String?
    public var discCount: UInt?
    public var discNumber: UInt?
    public var trackCount: UInt?
    public var trackNumber: UInt?
    public var trackTimeMillis: UInt?
    public var country: String?
    public var currency: String?
    public var primaryGenreName: String?
    public var copyright: String?
    public var shortDescription: String?
    public var longDescription: String?
    public var description: String?
    public var contentAdvisoryRating: String?
    public var isStreamable: Bool?

    
}
