//
//  String+custom.swift
//  Pods
//
//  Created by Incubasys on 14/09/2017.
//
//

import Foundation

extension String{
	public static func attributedString(firstComponent: String, otherComponent: String, firstFont: UIFont, otherfont: UIFont, textColor: UIColor, firstTextColor: UIColor) -> NSAttributedString {


        let firstAttrs = [NSAttributedStringKey.font: firstFont, NSAttributedStringKey.foregroundColor: firstTextColor]
        let firstAttributedString = NSAttributedString(string:"\(firstComponent) ", attributes: firstAttrs)
        
        let otherAttrs = [NSAttributedStringKey.font: otherfont, NSAttributedStringKey.foregroundColor: textColor]
        let otherAttributedString = NSAttributedString(string:"\(otherComponent)", attributes: otherAttrs)
        
        let finalAttributedString: NSMutableAttributedString!
        finalAttributedString = NSMutableAttributedString(attributedString: firstAttributedString)
        finalAttributedString.append(otherAttributedString)
       
        return finalAttributedString
    }
    
    public static func getMaxHeight(text: String, font: UIFont, width: CGFloat, maxHeight: CGFloat) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: width,height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        
        let height = label.frame.size.height + 16
        
        if height > maxHeight{
            return maxHeight
        }else{
            return height
        }
    }
    
    public static func isValidAlphabetWithNoWhiteSpace(forExp exp: String) -> Bool{
        if exp.rangeOfCharacter(from: NSCharacterSet.letters.inverted) != nil{
            return false
        }
        return true
    }


	public func isValid(forExp exp: String) -> Bool {
		return String.isValid(text: self, forExp: exp)
	}

	public static func isValid(text: String?,forExp exp: String) -> Bool {
		guard let value = text else { return false }
		guard let test = NSPredicate(format:"SELF MATCHES %@", exp) as NSPredicate? else { return false }
		return test.evaluate(with: value)
	}
}
