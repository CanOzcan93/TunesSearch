//
//  TSTextInput.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class TSTextInput: UITextField, UITextFieldDelegate {
    
    // Virtuals
    
    open func onInit() {}
    open func onInjection() {}
    open func onConstruct() {}
    open func onConstrain() {}
    
    public var onDraw: ActionWith<CGRect>!
    public var onPressReturnInKeyboard: Action?
    
    open var onBeginEdit: Action!
    open var onEndEdit: Action!
//    open var whileEdit: Action!

    
    // Variables
    
    private var layout: TSLayout?
    private var moveWhenEditing = false
    private var moveValue: CGFloat = 0
    
    // init
    
    public required init() { super.init(frame: .zero); self.initialize() }
    public required init?(coder decoder: NSCoder) { super.init(coder: decoder) }
    public func initialize() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.delegate = self
        
        onInit()
        onInjection()
        onConstruct()
        onConstrain()
        
    }
    
    
    // Draw Implementation
    
    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        onDraw?(rect)
    }
    
    
    // Tap Implementation
    
    private var onTapDelegate: Action!
    public func onTap(delegate: Action!) {
        
        self.onTapDelegate = delegate
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(on_tap))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(gesture)
        
    }
    
    @objc
    private func on_tap() {
        onTapDelegate()
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
    
    open func setPlaceholder(text: String, placeholderColor: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string: text, attributes: [.foregroundColor: placeholderColor])
    }
    
    /*
     -
     -
     // MARK: UITextField Delegate
     -
     -
     */
    
    private var whileEditDelegate: ActionWith<UITextField>!
    
    public func whileEdit(delegate: @escaping ActionWith<UITextField>){
        self.whileEditDelegate = delegate
        
        self.addTarget(self, action: #selector(TSTextInput.textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        self.whileEditDelegate?(textField)
    }
    
    public func textFieldDidBeginEditing(_ textField: UITextField) {
        if self.moveWhenEditing {
            let value = self.center.y - UIScreen.main.bounds.height/3
            if value > 0 {
                self.moveValue = value
                self.layout!.animateViewMoving(up: true, moveValue:moveValue)
            }
        }
        onBeginEdit?()
    }
    
    public func textFieldDidEndEditing(_ textField: UITextField) {
        if self.moveWhenEditing {
            self.layout!.animateViewMoving(up: false, moveValue:moveValue)
        }
        onEndEdit?()
    }
    
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onPressReturnInKeyboard?()
        return true
    }
    
    public func activateMovement(layout: TSLayout) {
        self.layout = layout
        self.moveWhenEditing = true
    }
    
    public func deactivateMovement() {
        self.layout = nil
        self.moveWhenEditing = false
    }
    
    public func applyBorderGradient(colors: [CGColor], rect: CGRect) {
        let outsideRect = rect.insetBy(dx: -16, dy: -1)
        
        let gradient = CAGradientLayer()
        gradient.colors = colors
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.frame = outsideRect
        
        let shape = CAShapeLayer()
        shape.lineWidth = 2
        shape.path = UIBezierPath(roundedRect: outsideRect.inset(by: UIEdgeInsets(top: 4, left: 18, bottom: 2, right: -14)), cornerRadius: outsideRect.height * 0.5).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        
        gradient.mask = shape
        self.layer.insertSublayer(gradient, at: 0)
        
    }
    
    
}
