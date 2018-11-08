//
//  ErrorView.swift
//  TemplateProject
//
//  Created by Mansoor Ali on 23/10/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//
import UIKit

public protocol ErrorViewDelegate: class {
	func errorView(_ errorView: ErrorView, didRetry sender: UIButton)
}

open class ErrorView: ErrorManagementView {

	//MARK: Properties
	weak var delegate: ErrorViewDelegate?
	public var message: String?

}
