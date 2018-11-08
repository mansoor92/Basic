//
//  UIImage+custom.swift
//  Basic
//
//  Created by Mansoor Ali on 15/08/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import UIKit

//MARK: Custom Initializer
public extension UIImage {
	public static func image(fromColor color: UIColor, size: CGSize) -> UIImage {
		let rect = CGRect(x: 0,y: 0,width: size.width,height: size.height)
		UIGraphicsBeginImageContextWithOptions(size, false, 0)
		color.setFill()
		UIRectFill(rect)
		let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
		UIGraphicsEndImageContext()
		return image
	}

	public func image(withTint tint: UIColor) -> UIImage{
		UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
		tint.setFill()

		let context = UIGraphicsGetCurrentContext()! as CGContext
		context.translateBy(x:0,y:self.size.height)
		context.scaleBy(x:1.0,y:-1.0)
		context.setBlendMode(.normal)

		let rect = CGRect(x: 0,y: 0,width: self.size.width,height: self.size.height)
		context.clip(to:rect,mask:self.cgImage!)
		context.fill(rect)

		let newImage = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
		UIGraphicsEndImageContext()

		return newImage
	}
}

//MARK:- Rounded Image
public extension UIImage{

	public var rounded: UIImage? {
		let imageView = UIImageView(image: self)
		imageView.layer.cornerRadius = min(size.height/4, size.width/4)
		imageView.layer.masksToBounds = true
		UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
		guard let context = UIGraphicsGetCurrentContext() else { return nil }
		imageView.layer.render(in:context)
		let result = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return result
	}

	public var circle: UIImage? {
		let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
		let imageView = UIImageView(frame: CGRect(origin: .zero, size: square))
		imageView.contentMode = .scaleAspectFill
		imageView.image = self
		imageView.layer.cornerRadius = square.width/2
		imageView.layer.masksToBounds = true
		UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
		guard let context = UIGraphicsGetCurrentContext() else { return nil }
		imageView.layer.render(in:context)
		let result = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return result
	}
}

//MARK:- Scaling
public extension UIImage{

	public class func scaleImage(image:UIImage,width:CGFloat)-> UIImage{
		let ratio = image.size.width / image.size.height
		let newHeight = width / ratio
		let size = CGSize(width: width, height: newHeight)
		return UIImage.scaleImage(image:image, size: size)
	}

	public class func scaleImage(image:UIImage,height:CGFloat)-> UIImage{
		let ratio = image.size.width / image.size.height
		let newWidth = height * ratio
		let size = CGSize(width: newWidth, height: height)
		return UIImage.scaleImage(image:image, size: size)
	}

	private class func scaleImage(image:UIImage,size:CGSize)->UIImage{
		// This is the rect that we've calculated out and this is what is actually used below
		let rect = CGRect(x:0,y: 0, width: size.width,height: size.height)

		// Actually do the resizing to the rect using the ImageContext stuff
		UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
		image.draw(in:rect)
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return newImage!
	}
}

//MARK:- Encoding
public extension UIImage{

	public class func encodeToBase64(image:UIImage)->String{
		let data = UIImagePNGRepresentation(image)
		let base64String = data?.base64EncodedString(options: .lineLength64Characters)
		guard base64String != nil else {
			return ""
		}
		return base64String!
	}
}
