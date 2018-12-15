//
//  Protocols.swift
//  Basic
//
//  Created by Mansoor Ali on 26/10/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import Foundation

public enum ErrorContext {
	/// Specify the error display context when hasData is true : use the error message, or use data oriented priority
	///
	/// - dataOriented: For this type, the error message will show that data inconsistency is possible
	/// - errorOriented: The error message always use the Error type localized message if available, default message if needed
	case dataOriented
	case errorOriented
}

public protocol Reloadable {
	var hasData: Bool { get }
}

public protocol Failable {
	var errorContext: ErrorContext { get }
}
