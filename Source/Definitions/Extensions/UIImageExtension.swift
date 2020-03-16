//
//  UIImageExtension.swift
//  TunesSearch
//
//  Created by Can Özcan on 12.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

extension UIImage {
    /// Loads an image from the specified URL on a background thread
    static func load(from url: URL, completion: @escaping (Result<UIImage, Error>) -> Void) {
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                guard let image = UIImage(data: data) else {
                    completion(.failure(URLError(.dataNotAllowed)))
                    return
                }

                DispatchQueue.main.async {
                    completion(.success(image))
                }
            } catch {
                completion(.failure(URLError(.dataNotAllowed)))
            }
        }
    }
}
