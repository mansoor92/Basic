//
//  StoryBoardLoabableView.swift
//  Pods
//
//  Created by Incubasys on 24/07/2017.
//
//

import UIKit

//MARK: StoryBoardLoadableView
public protocol StoryBoardLoadableView{}
public extension StoryBoardLoadableView where Self: UIViewController{
    public static var sceneName: String {
        let str = String(describing: self)
        return str
    }
}

//MARK: NibLoadableView
public protocol NibLoadableView {}
public extension NibLoadableView where Self: UIView{
	public static var nibName: String{
		return String(describing: self)
	}
}

public extension NibLoadableView where Self: UIViewController{
	public static var nibName: String{
		return String(describing: self)
	}
}

