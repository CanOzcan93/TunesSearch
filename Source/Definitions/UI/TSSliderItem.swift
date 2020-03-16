//
//  TSSliderItem.swift
//  TunesSearch
//
//  Created by Can Özcan on 13.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

public class TSSliderItem: TSView {
    
    // Sharepoint
    
    private var sharepoint: TSSharepoint!
    
    private var agency: TSAgency!
    
    private var provider: TSProvider!
    
    public var fontProvider: TSFontProvider!
    public var colorProvider: TSColorProvider!
    public var imageProvider: TSImageProvider!
    
    open override func onInjection() {
        
        super.onInjection()
        
        sharepoint = TSSharepoint.getInstance()
        
        agency = sharepoint.agency
        
        provider = agency.provider
        
        fontProvider = provider.fontProvider
        colorProvider = provider.colorProvider
        imageProvider = provider.imageProvider
        
    }

    
}
