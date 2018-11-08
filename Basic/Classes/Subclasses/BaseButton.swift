//
//  BaseButton.swift
//  Basic
//
//  Created by Mansoor Ali on 05/09/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import UIKit

open class BaseButton: UIButton {

	override public init(frame: CGRect) {
		super.init(frame: frame)
		customizeUI()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		customizeUI()
	}

	open func customizeUI(){}
}
