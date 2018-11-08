//
//  CardView.swift
//  Basic
//
//  Created by Mansoor Ali on 19/10/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import UIKit

open class CardView: UIView {

	@IBInspectable public var shadowColor = UIColor.black
	@IBInspectable public var shadowOpacity: Float = 1
	@IBInspectable public var shadowOffSet = CGSize(width: 0, height: 1)
	@IBInspectable public var shadowRadius: CGFloat = 1
	@IBInspectable public var shadowScale = true


	override open func layoutSubviews() {
		super.layoutSubviews()
		self.dropShadow(color: shadowColor, opacity: shadowOpacity, offSet: shadowOffSet, radius: shadowRadius, scale: shadowScale)
	}

}
