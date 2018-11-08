//
//  BasicProgressView.swift
//  TemplateProject
//
//  Created by Mansoor Ali on 24/10/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import UIKit

open class ProgressView: ErrorManagementView {

	override public init(frame: CGRect) {
		super.init(frame: frame)
		customizeUI()
	}

	required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	public func customizeUI() {
		self.backgroundColor = UIColor.black.withAlphaComponent(0.5)

		let indicatorView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
		indicatorView.tintColor = UIColor.red
		indicatorView.startAnimating()
		add(indicatorView: indicatorView, to: self)
	}

	private func add(indicatorView child: UIActivityIndicatorView, to parent: UIView) {
		child.translatesAutoresizingMaskIntoConstraints = false
		parent.addSubview(child)

		child.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive = true
		child.centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive = true
	}
}
