//
//  TGTextField.swift
//  Newzician
//
//  Created by Taimour Tanveer on 01/08/2016.
//  Copyright © 2016 Pantera. All rights reserved.
//

import UIKit

public protocol ValidationMsgDelegate: class {
	func validationMsg(field: ValidationMsgTextField, didTapValidationIcon icon: UIImageView, status: InputValidationStatus)
	func validationMsg(field: ValidationMsgTextField, hideTipView tipView: UIView)
}

open class ValidationMsgTextField: UITextField, Shakeable {

	//MARK: IBInspectable
    @IBInspectable var bottomBorderWidth : CGFloat = 0.5
    @IBInspectable var bottomBorderColor =  UIColor(netHex: 0xEEEEEE)
	@IBInspectable public var errorImage: UIImage?
	@IBInspectable public var successImage: UIImage?

	@IBInspectable var showValidationIcon: Bool = true {
		didSet{
			if self.showValidationIcon {
				validationIcon = UIImageView()
				validationIcon?.isUserInteractionEnabled = true
				addTap(to: validationIcon!)
				validationIcon?.contentMode = .scaleAspectFit
				validationIcon?.clipsToBounds = true
				rightViewMode = .always
				rightView = validationIcon
			}else {
				validationIcon = nil
				rightView = nil
				rightViewMode = .never
			}
		}
	}

	//MARK: Properties
	private var validationIcon: UIImageView?
	private var validateionStatus: InputValidationStatus = .empty
	private weak var tipView: UIView?
//	private var exp: String = "."
	public weak var validationDelegate: ValidationMsgDelegate?

	//MARK: Life cycle
    override public init(frame: CGRect) {
        super.init(frame: frame)
		setupView()
    }

	required public init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)!
		//self.setupPlaceHolder()
	}

	open override func layoutSubviews() {
		super.layoutSubviews()
		let y = (self.frame.size.height / 2) - 10
		validationIcon?.frame = CGRect(x: self.frame.size.width-20-16, y: y, width: 20, height: 20)
//		validationIcon?.center = CGPoint(x: validationIcon!.center.x, y: self.center.y)
	}

    override open  func awakeFromNib() {
        super.awakeFromNib()
        self.setupView()
    }

	//MARK: UI
	func setupView() {
		showValidationIcon = true
		addTarget(self, action: #selector(didEndEditing(_:)), for: .editingDidEnd)
	}

	//MARK: Validations
	public func set(validationStatus: InputValidationStatus) {
		if !showValidationIcon {
			showValidationIcon = true
		}
		switch validationStatus {
		case .inprocess:
			addActivityIndicatory()
		case .invalid(_):
			validationIcon?.image = errorImage
			validationIcon?.isHidden = false
		case .valid:
			validationIcon?.image = successImage
			validationIcon?.isHidden = false
		case .empty:
			validationIcon?.isHidden = true
			validationIcon?.image = nil
		}
		self.validateionStatus = validationStatus
	}

	public func set(tipView: UIView) {
		self.tipView = tipView
	}

	@objc open override func addActivityIndicatory() {
		validationIcon = nil
		showValidationIcon = false
		rightView = nil
		super.addActivityIndicatory()
	}

//	private func add(validationIcon child: UIView, to parent: UIView) {
////		child.translatesAutoresizingMaskIntoConstraints = false
////		parent.addSubview(child)
//		parent.trailingAnchor.constraint(equalTo: child.trailingAnchor, constant: 16).isActive = true
//		child.centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
//		child.heightAnchor.constraint(equalToConstant: 20).isActive = true
//		child.widthAnchor.constraint(equalTo: child.heightAnchor).isActive = true
//	}

	//MARK: Actions
	private func addTap(to view: UIView) {
		let tap = UITapGestureRecognizer(target: self, action: #selector(didTapValidationIcon(_:)))
		view.addGestureRecognizer(tap)
	}

	@objc private func didEndEditing(_ sender: ValidationMsgTextField) {
		guard tipView != nil else {
			return
		}
		validationDelegate?.validationMsg(field: self, hideTipView: tipView!)
	}

	@objc private func didTapValidationIcon(_ sender: UITapGestureRecognizer) {
		guard tipView == nil else {
			validationDelegate?.validationMsg(field: self, hideTipView: tipView!)
			return
		}
		if !self.isFirstResponder {
			self.becomeFirstResponder()
		}
		guard let imgView = validationIcon else {
			return
		}
		validationDelegate?.validationMsg(field: self, didTapValidationIcon: imgView, status: validateionStatus)
	}
	/*

	public func set(validationExp: String?) {
	guard let exp = validationExp else {
	self.removeTarget(self, action: #selector(validate), for: .editingChanged)
	return
	}
	self.exp = exp
	self.addTarget(self, action: #selector(validate), for: .editingChanged)
	}

	@objc private func validate() {
		guard !(text ?? "" ).isEmpty else {
			validationImageView?.image = nil
			return
		}

		if isValidInput() {
			validationImageView?.image = successImage
		}else {
			validationImageView?.image = errorImage
		}
	}

	func isValidInput() -> Bool {
		return String.isValid(text: text, forExp: exp)
	}*/
}
