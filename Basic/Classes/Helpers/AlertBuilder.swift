//
//  AlertBuilder.swift
//  ShadiMaster
//
//  Created by Mansoor Ali on 26/06/2018.
//  Copyright © 2018 Yasir Ali. All rights reserved.
//

import UIKit

public protocol CustomizableAlert {
	static func instance(title: String?, msg: String?, actions: [CustomAlertAction]) -> CustomizableAlert
	func show(controller: UIViewController, animated: Bool, completion: (() -> Void)?)
	func hide(animated: Bool, completion: (() -> Void)?)
}

public protocol CustomAlertAction {
	var handler: (() -> Void)? {get set}
	func customAlertActionView () -> UIView
}

public class AlertBuilder<T> where T: CustomizableAlert {
	private var title: String?
	private var msg: String?
	private var actions: [CustomAlertAction]

	public init() {
		actions = []
	}

	public func add(title: String?) -> AlertBuilder<T> {
		self.title = title
		return self
	}

	public func add(msg: String?) -> AlertBuilder<T> {
		self.msg = msg
		return self
	}

	public func add(action: CustomAlertAction)  -> AlertBuilder<T> {
		self.actions.append(action)
		return self
	}

	public func add(actions: [CustomAlertAction])  -> AlertBuilder<T> {
		self.actions.append(contentsOf: actions)
		return self
	}

	public func build() -> CustomizableAlert {
		return T.instance(title: title, msg: msg, actions: actions)
	}
}
