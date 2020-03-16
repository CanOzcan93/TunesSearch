//
//  TSImageProvider.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class TSImageProvider {
    
    public required init() {
        
    }
    
    private var left_arrow: UIImage?
    public func getLeftArrow() -> UIImage {
        
        guard left_arrow != nil else {
            left_arrow = UIImage(named: "ic_left_arrow")
            return left_arrow!
        }
        
        return left_arrow!
        
    }
    
    private var star: UIImage?
    public func getStar() -> UIImage {
        
        guard star != nil else {
            star = UIImage(named: "ic_star")
            return star!
        }
        
        return star!
        
    }
    
}
