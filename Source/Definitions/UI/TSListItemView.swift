//
//  TSListItemView.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class TSListItemView: UITableViewCell {
    
    
    // Internal Fields
    
    private var set: [NSLayoutConstraint]!
    
    // External Fields
    
    open var item: TSView!
    open class var dequeueItemName: String {
        return "item"
    }
    
    
    // Virtuals
    
    open func onInit() {
        item = TSView()
        item.backgroundColor = .white
        contentView.addSubview(item)
    }
    open func onConstruct(wrapper: UIView, item: TSView) {}
    open func onConstrain(set: inout [NSLayoutConstraint], wrapper: UIView, item: TSView) {}
    
    public var onDraw: ActionWith<CGRect>!
    
    
    // init
    
    public init() {
        
        super.init(style: .default, reuseIdentifier: "item")
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.set = [NSLayoutConstraint]()
        
        let wrapper = contentView
        self.backgroundColor = .white
        
        onInit()
        onInjection()
        
        onConstruct(wrapper: wrapper, item: item)
        onConstrain(set: &self.set, wrapper: wrapper, item: item)
        
        //        for sets in set {
        //            self.contentView.addConstraint(sets)
        //        }
        
        self.contentView.addConstraints(self.set)
        
    }
    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }
    
    
    // Draw Implementation
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        onDraw?(rect)
    }
    
    
    // Constraining
    
    open func relayout() {
        
        (self.superview as! UITableView).beginUpdates()
        self.contentView.layoutIfNeeded()
        (self.superview as! UITableView).endUpdates()
        
    }
    
    public func constrain(constraint: NSLayoutConstraint) {
        self.contentView.addConstraint(constraint)
    }
    
    public func release(constraint: NSLayoutConstraint) {
        self.contentView.removeConstraint(constraint)
    }
    
    public func shift(from: NSLayoutConstraint, to: NSLayoutConstraint) {
        self.release(constraint: from)
        self.constrain(constraint: to)
    }
    
    /*
     -
     -
     // MARK: Sharepoint
     -
     -
     */
    
    private var sharepoint: TSSharepoint!
    
    private var agency: TSAgency!
    
    private var provider: TSProvider!
    
    public var colorProvider: TSColorProvider!
    public var fontProvider: TSFontProvider!
    public var imageProvider: TSImageProvider!
    
    open func onInjection() {
        
        sharepoint = TSSharepoint.getInstance()
        
        agency = sharepoint.agency
        
        provider = agency.provider
        
        colorProvider = provider.colorProvider
        fontProvider = provider.fontProvider
        imageProvider = provider.imageProvider
        
    }
    
}
