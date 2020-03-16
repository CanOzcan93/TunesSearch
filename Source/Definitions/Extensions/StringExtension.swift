//
//  StringExtension.swift
//  FacebookFriends
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//


import Foundation
import CryptoKit

extension String {
    /// Converts HTML string to a `NSAttributedString`

    var htmlAttributedString: NSAttributedString? {
        return try? NSAttributedString(data: Data(utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
    }
    
    var firstLowercased: String { return prefix(1).lowercased() + dropFirst() }

    var MD5 : String {
        let digest = Insecure.MD5.hash(data: self.data(using: .utf8) ?? Data())

        return digest.map {
            String(format: "%02hhx", $0)
        }.joined()
    }
    
    var iso8601: Date? {
        return Formatter.iso8601.date(from: self)
    }
    
}
