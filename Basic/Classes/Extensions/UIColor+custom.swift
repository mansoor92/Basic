//
//  Color+custom.swift
//  71stStreet
//
//  Created by Pantera Engineering on 21/11/2016.
//  Copyright © 2016 Incubasys IT Solutions. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
	
	private convenience init(red: Int, green: Int, blue: Int) {
		assert(red >= 0 && red <= 255, "Invalid red component")
		assert(green >= 0 && green <= 255, "Invalid green component")
		assert(blue >= 0 && blue <= 255, "Invalid blue component")

		self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
	}

	public convenience init(netHex:Int) {
		self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
	}

	public convenience init(hexString: String, alpha:CGFloat = 1.0) {
		var hex: UInt32 = 0
		let scanner: Scanner = Scanner(string: hexString)
		scanner.scanHexInt32(&hex)

		let hexInt = Int(hex)
		let red = CGFloat((hexInt & 0xff0000) >> 16) / 255.0
		let green = CGFloat((hexInt & 0xff00) >> 8) / 255.0
		let blue = CGFloat((hexInt & 0xff) >> 0) / 255.0

		self.init(red: red, green: green, blue: blue, alpha: 1.0)
	}

	public func toRgba() -> [CGFloat] {
		var r:CGFloat = 0
		var g:CGFloat = 0
		var b:CGFloat = 0
		var a:CGFloat = 0

		if getRed(&r, green: &g, blue: &b, alpha: &a){
			return [r,g,b,a]
		}

		return[0,0,0,0]
	}

	public func toRgbaString() -> String{
		let rgba = toRgba()
		return "RGB(\(rgba[0]*255),\(rgba[1]*255),\(rgba[2]*255),\(rgba[3]))"
	}

	public func toHexString() -> String {

		let rgba = toRgba()
		let rgb:Int = (Int)(rgba[0]*255)<<16 | (Int)(rgba[1]*255)<<8 | (Int)(rgba[2]*255)<<0

		return String(format: "#%06x", rgb)
	}

}

