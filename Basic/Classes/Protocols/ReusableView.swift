//
//  ReusableView.swift
//  Basic
//
//  Created by Mansoor Ali on 20/08/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import UIKit

public protocol ReuseableView {}
public extension ReuseableView where Self: UIView{
	public static var reuseId: String{
		return String(describing: self)
	}
}
