//
//  TSSlider.swift
//  TunesSearch
//
//  Created by Can Özcan on 13.03.2020.
//  Copyright © 2020 CanOzcan. All rights reserved.
//

import UIKit

open class TSSlider<SliderItemType: TSSliderItem, LayoutType: TSLayout>: UIScrollView, UIScrollViewDelegate {

    // Virtuals

    open func onInit() {}
    open func onInjection() {}
    open func onConstruct() {}
    open func onConstrain() {}

    public var onDraw: ActionWith<CGRect>!

    public var onPageChanged: Action!

    // Required Fields

    public var items: [SliderItemType]!
    public var layout: LayoutType!

    public var spacePages: CGFloat!

    public init(items: [SliderItemType], layout: LayoutType, spacePages: CGFloat) {

        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false

        self.isPagingEnabled = false
        self.backgroundColor = UIColor.clear
        self.contentInsetAdjustmentBehavior = .never
        self.clipsToBounds = false
        self.decelerationRate = .fast


        self.layout = layout
        self.items = items
        self.spacePages = spacePages
        self.delegate = self
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        for i in 0..<items.count {
            self.addSubview(items[i])
        }

        layout.addSubview(self)

        onInit()
        onInjection()
        onConstruct()
        onConstrain()
    }

    public required init?(coder decoder: NSCoder) {
        super.init(coder: decoder)
    }

    open override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.contentSize = CGSize(width: (self.items.last!.frame.maxX + CGFloat(self.spacePages)), height: rect.height)
        self.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
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

}
