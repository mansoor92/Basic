//
//  UIView.swift
//  Basic
//
//  Created by Mansoor Ali on 20/08/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import UIKit

extension UIView {

	public static func instance<T: UIView>(_ : T.Type) -> T where T: NibLoadableView{
		return UINib(nibName: T.nibName, bundle: .main)
			.instantiate(withOwner: self, options: nil)
			.first as! T
    }

	public func showTestBorder(color: UIColor = UIColor.red, borderWidth: CGFloat = 1) {
		self.layer.borderWidth = borderWidth
		self.layer.borderColor = color.cgColor
	}
    
    public func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        // to avoid blurred content if scale is true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
