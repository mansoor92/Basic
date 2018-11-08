//
//  ProgressView.swift
//  TemplateProject
//
//  Created by Mansoor Ali on 23/10/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import UIKit


public protocol ViewAnimatable {
	func playAnimation()
	func stopAnimation()
}


public protocol ViewDisplayable {

	func show(fromViewController viewController: UIViewController,
			  insets: UIEdgeInsets,
			  animated: Bool,
			  completion: ((Bool) -> Void)? )

	func show(fromView view: UIView,
			  insets: UIEdgeInsets,
			  animated: Bool,
			  completion: ((Bool) -> Void)? )
}


open class ErrorManagementView: UIView, ViewAnimatable, ViewDisplayable {

	public var animationDuration: Double = 0.3
	fileprivate(set) var isAnimating = false


	override public init(frame: CGRect) {
		super.init(frame: frame)
		configureView()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		configureView()
	}

	override open func awakeFromNib() {
		super.awakeFromNib()
		configureView()
	}

	private func configureView() {
		self.alpha = 0
	}

	public func playAnimation() {
		isAnimating = true
	}

	public func stopAnimation() {
		isAnimating = false
	}

	fileprivate func show(animated: Bool, completion:((Bool) -> Void)? = nil) {
		self.superview?.bringSubview(toFront: self)
		if animated {
			UIView.animate(withDuration: animationDuration, animations: { [weak self] in
				self?.alpha = 1
				}, completion: completion)
		}else {
			self.alpha = 1
			completion?(true)
		}
	}

	public func hide(animated: Bool, completion: ((Bool) -> Void)?) {
		self.stopAnimation()
		let closure: (Bool) -> Void  = { (finished) in
			if finished { self.removeFromSuperview() }
		}
		if animated {
			UIView.animate(withDuration: self.animationDuration, delay: 0.25, animations: {
				self.alpha = 0
			}) { (finished) in
				closure(finished)
				completion?(finished)
			}
		}else {
			self.alpha = 0
			closure(true)
			completion?(true)
		}
	}


	public func show(fromViewController viewController: UIViewController,
			  insets: UIEdgeInsets,
			  animated: Bool,
			  completion: ((Bool) -> Void)? = nil) {


		add(view: self, to: viewController.view, withInsets: insets)

		//Show With animation
		self.show(animated: animated) { [weak self] (finished) in
			if finished {
				self?.playAnimation()
			}
			completion?(finished)
		}
	}


	public func show(fromView view: UIView,
			  insets: UIEdgeInsets,
			  animated: Bool,
			  completion: ((Bool) -> Void)? = nil) {


		add(view: self, to: view, withInsets: insets)

		//Show With animation
		self.show(animated: animated) { [weak self] (finished) in
			if finished {
				self?.playAnimation()
			}
			completion?(finished)
		}
	}

	private func add(view child: ErrorManagementView, to parent: UIView, withInsets insets: UIEdgeInsets)  {
		parent.addSubview(child)
		child.alpha = 0
		child.superview?.sendSubview(toBack: child)

		//Autolayout constraints
		child.translatesAutoresizingMaskIntoConstraints = false
		child.topAnchor.constraint(equalTo: parent.topAnchor, constant: insets.top).isActive = true
		parent.bottomAnchor.constraint(equalTo: child.bottomAnchor, constant: insets.bottom).isActive = true
		child.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: insets.left).isActive = true
		parent.trailingAnchor.constraint(equalTo: child.trailingAnchor, constant: insets.right).isActive = true
	}
}



