//
//  TSLayout.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class TSLayout: UIView {
    
    /*
     -
     -
     // MARK: Basic Definitions
     -
     -
     */
    
    // Internal Fields
    
    private var set: [NSLayoutConstraint]!
    
    // Virtuals
    
    open func onInit() {}
    open func onConstruct() {}
    open func onConstrain(set: inout [NSLayoutConstraint]) {}
    open func afterConstrain() {}
    open var setTouchEvent: Action?
    
    // init
    
    public required init() { super.init(frame: .zero); self.initialize() }
    public required init?(coder decoder: NSCoder) { super.init(coder: decoder) }
    private func initialize() {
        
        let window = TSApplication.window!
        
        let top = window.safeAreaInsets.top
        let bottom = window.safeAreaInsets.bottom
        
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height - top - bottom + 16
        
        let origin = CGPoint(x: 0, y: top)
        let size = CGSize(width: width, height: height)
        
        self.frame = CGRect(origin: origin, size: size)
        
        self.translatesAutoresizingMaskIntoConstraints = true
        
        self.set = [NSLayoutConstraint]()
        
        onInit()
        onInjection()
        onConstruct()
        
        onConstrain(set: &self.set)
        self.addConstraints(set)
        self.layoutIfNeeded()
        afterConstrain()
        
    }
    
    
    // Constraining
    
    public func relayout() {
        self.layoutIfNeeded()
    }
    
    public func constrain(constraint: NSLayoutConstraint) {
        self.addConstraint(constraint)
    }
    
    public func release(constraint: NSLayoutConstraint) {
        self.removeConstraint(constraint)
    }
    
    public func shift(from: NSLayoutConstraint, to: NSLayoutConstraint) {
        self.release(constraint: from)
        self.constrain(constraint: to)
    }
    
    open override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.setTouchEvent?()
    }
    
    // Movement
    
    open func animateViewMoving (up:Bool, moveValue :CGFloat){
        let movementDuration:TimeInterval = 0.3
        let movement:CGFloat = ( up ? -moveValue : moveValue)
        if up {
            self.frame = self.frame.insetBy(dx: 0, dy: movement)
        } else {
            self.frame = self.frame.offsetBy(dx: 0, dy: movement)
        }
        UIView.beginAnimations( "animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        if up {
            self.frame = self.frame.offsetBy(dx: 0, dy: movement)
        } else {
            self.frame = self.frame.insetBy(dx: 0, dy: movement)
        }
        UIView.commitAnimations()
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
    
    private var provider: TSProvider!
    
    public var fontProvider: TSFontProvider!
    public var colorProvider: TSColorProvider!
    public var imageProvider: TSImageProvider!
    
    open func onInjection() {
        
        sharepoint = TSSharepoint.getInstance()
        
        agency = sharepoint.agency
        
        provider = agency.provider
        
        fontProvider = provider.fontProvider
        colorProvider = provider.colorProvider
        imageProvider = provider.imageProvider
        
    }
    
}
