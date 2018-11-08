//
//  UITextField+custom.swift
//  Basic
//
//  Created by Mansoor Ali on 20/08/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import Foundation

extension UITextField{

	@objc open func addActivityIndicatory()  {
		let ind = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
		ind.activityIndicatorViewStyle = .gray
		let view = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 15))
		view.addSubview(ind)
		self.rightViewMode = .always
		ind.startAnimating()
		self.rightView = view
	}

	@objc open func removeActivityIndicator()  {
		self.rightView = nil
		self.rightViewMode = .never
	}
}
