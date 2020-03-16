//
//  TSMultilineTextInput.swift
//  TunesSearch
//
//  Created by Can Özcan on 10.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class TSMultilineTextInput: UITextView, UITextViewDelegate {
    
    // Virtuals
    
    open func onInit() {}
    open func onInjection() {}
    open func onConstruct() {}
    open func onConstrain() {}
    
    open var onBegin: Action?
    open var onEnd: Action?
    
    public var onDraw: ActionWith<CGRect>!
    
    
    // init
    
    public required init() { super.init(frame: .zero, textContainer: nil); self.initialize() }
    public override init(frame: CGRect, textContainer: NSTextContainer?) { super.init(frame: frame, textContainer:textContainer); self.initialize() }
    public required init?(coder decoder: NSCoder) { super.init(coder: decoder) }
    private func initialize() {
        
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
    
    public func textViewDidBeginEditing(_ textView: UITextView) {
        self.onBegin?()
    }
    
    public func textViewDidEndEditing(_ textView: UITextView) {
        self.onEnd?()
    }
    
}
