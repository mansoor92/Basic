//
//  UITableViewCell+custom.swift
//  Basic
//
//  Created by Mansoor Ali on 20/08/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import Foundation

extension UITableViewCell: ReuseableView{}

extension UITableViewCell {
	
	public func hideDefaultSeparator(){
		let indent_large_enought_to_hidden:CGFloat = 10000
		separatorInset = UIEdgeInsetsMake(0, indent_large_enought_to_hidden, 0, 0)
		indentationWidth = indent_large_enought_to_hidden * -1
		indentationLevel = 1
	}
}
