//
//  TSButton.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class TSButton: UIButton {
    
    private var bg_layer: CAGradientLayer!
    
    // Virtuals
    
    open func onInit() {}
    open func onInjection() {}
    open func onConstruct() {}
    open func onConstrain() {}
    
    public var onDraw: ActionWith<CGRect>!
    
    
    // init
    
    public required init() { super.init(frame: .zero); self.initialize() }
    public required init?(coder decoder: NSCoder) { super.init(coder: decoder) }
    private func initialize() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        onInit()
        onInjection()
        onConstruct()
        onConstrain()
        
    }
    
    
    // Click Implementation
    
    private var onClickDelegate: Action!
    public func onClick(_ delegate: Action!) {
        
        self.onClickDelegate = delegate
        
        self.addTarget(self, action: #selector(on_click), for: .touchUpInside)
        
    }
    
    @objc
    private func on_click() {
        self.onClickDelegate()
    }
    
    private var onClickDelegateWithButton: ActionWith<TSButton>!
    
    public func onClickWithButton(_ delegate: ActionWith<TSButton>!) {
        
        self.onClickDelegateWithButton = delegate
        
        self.addTarget(self, action: #selector(on_click_with_button), for: .touchUpInside)
        
    }
    
    @objc
    private func on_click_with_button() {
        self.onClickDelegateWithButton(self)
    }
    
    
    // Draw Implementation
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        onDraw?(rect)
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
    
    public func applyBackgroundGradient(colors: [CGColor], rect: CGRect, rounded: Bool)
    {
     
        if bg_layer == nil {
            bg_layer = CAGradientLayer()
            self.layer.insertSublayer(bg_layer, at: 0)
        }

        bg_layer.colors = colors
        bg_layer.startPoint = CGPoint(x: 0, y: 0)
        bg_layer.endPoint = CGPoint(x: 1, y: 0)
        bg_layer.frame = rect

        if rounded {
            let shape = CAShapeLayer()
            shape.lineWidth = 1
            shape.path = UIBezierPath(roundedRect: rect.insetBy(dx: 2, dy: 2), cornerRadius: rect.height * 0.5).cgPath
            shape.strokeColor = UIColor.black.cgColor
            shape.backgroundColor = UIColor.clear.cgColor
            bg_layer.mask = shape
        } else {
            bg_layer.mask = nil
        }

        self.setNeedsDisplay()
        
    }
    
    public func applyBorderGradient(colors: [CGColor], rect: CGRect, rounded: Bool)
    {
        
        if bg_layer == nil {
            bg_layer = CAGradientLayer()
            self.layer.insertSublayer(bg_layer, at: 0)
        }
        
        bg_layer.colors = colors
        bg_layer.startPoint = CGPoint(x: 0, y: 0)
        bg_layer.endPoint = CGPoint(x: 1, y: 0)
        bg_layer.frame = rect
        
        
        if rounded {
            let shape = CAShapeLayer()
            shape.lineWidth = 1
            shape.path = UIBezierPath(roundedRect: rect.insetBy(dx: 2, dy: 2), cornerRadius: rect.height * 0.5).cgPath
            shape.strokeColor = UIColor.black.cgColor
            shape.fillColor = UIColor.clear.cgColor
            
            bg_layer.mask = shape
        } else {
            bg_layer.mask = nil
        }
        
        
        self.setNeedsDisplay()
        
//        let gradient = CAGradientLayer()
//        gradient.colors = colors
//        gradient.startPoint = CGPoint(x: 0, y: 0)
//        gradient.endPoint = CGPoint(x: 1, y: 0)
//        gradient.frame = rect
//
//        let shape = CAShapeLayer()
//        shape.lineWidth = 3
//        shape.path = UIBezierPath(roundedRect: rect, cornerRadius: rect.height * 0.5).cgPath
//        shape.strokeColor = UIColor.black.cgColor
//        shape.fillColor = UIColor.clear.cgColor
//
//        gradient.mask = shape
//
//        self.layer.insertSublayer(gradient, at: 0)
        
    }

}
