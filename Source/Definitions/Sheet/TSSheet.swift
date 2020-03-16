//
//  TSSheet.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import Foundation

import UIKit

open class TSSheet<LayoutType: TSLayout>: UIViewController {
    
    /*
     -
     -
     // MARK: Basic Definitions
     -
     -
     */
    
    private var initialized: Bool = false
    
    private var layout: LayoutType!
    
    open func onInit() {}
    open func onLayoutReady(layout: LayoutType) {}
    open func onLayoutAppear(layout: LayoutType) {}
    open func onLayoutFirstAppear(layout: LayoutType) {}
    open func onLayoutReappear(layout: LayoutType) {}
    open func onLayoutDisappear(layout: LayoutType) {}
    
    open func onDismiss() {}
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        onInjection()
        
        onInit()
        
        layout = LayoutType.init()
        
        self.view = layout
        
        onLayoutReady(layout: layout)
        
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        if (initialized) {
            onLayoutReappear(layout: layout)
        }
        else {
            onLayoutFirstAppear(layout: layout)
        }
        onLayoutAppear(layout: layout)
        
        self.initialized = true
        
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        
        onLayoutDisappear(layout: layout)
        
        super.viewDidDisappear(animated)
        
        
    }
    
    open override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        
        onDismiss()
        
        super.dismiss(animated: flag, completion: completion)
        
    }
    
    /*
     -
     -
     // MARK: Sharepoint Definitions
     -
     -
     */
    
    private var sharepoint: TSSharepoint!
    
    private var agency: TSAgency!
    private var repository: TSRepository!
    
    private var manager: TSManager!
    private var provider: TSProvider!
    
    open var apiManager: TSApiManager!
    open var eventManager: TSEventManager!
    open var networkManager: TSNetworkManager!
    open var mediaManager: TSMediaManager!
    
    open var fontProvider: TSFontProvider!
    open var colorProvider: TSColorProvider!
    open var imageProvider: TSImageProvider!
    
    open var dataStorage: TSDataStorage!
    open var exchangeFlow: TSExchangeFlow!
    open var persistentStorage: TSPersistentStorage!
    open var stateMachine: TSStateMachine!
    
    open func onInjection() {
        
        sharepoint = TSSharepoint.getInstance()
        
        agency = sharepoint.agency
        repository = sharepoint.repository
        
        manager = agency.manager
        provider = agency.provider
        
        apiManager = manager.apiManager
        eventManager = manager.eventManager
        networkManager = manager.networkManager
        mediaManager = manager.mediaManager
        
        colorProvider = provider.colorProvider
        fontProvider = provider.fontProvider
        imageProvider = provider.imageProvider
        
        dataStorage = repository.dataStorage
        exchangeFlow = repository.exchangeFlow
        persistentStorage = repository.persistentStorage
        stateMachine = repository.stateMachine
        
    }
    
}
