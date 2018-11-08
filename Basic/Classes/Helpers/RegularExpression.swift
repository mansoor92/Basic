//
//  Validator.swift
//  Basic
//
//  Created by Mansoor Ali on 29/08/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import Foundation

public enum RegularExpression: String {
	case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
    case phone = "^\\d{3}-\\d{3}-\\d{4}$"
    case dubaiPhone = "^\\d{9}$"
	case password = ".{6,}"
	case notEmpty = ".{1,}"
}

public enum InputValidationStatus: Equatable {
	case empty
	case inprocess
	case valid
	case invalid(String?)


	public static func == (lhs: InputValidationStatus, rhs: InputValidationStatus) -> Bool {
		switch (lhs,rhs) {
		case (.empty,.empty):
			return true
		case (.inprocess,.inprocess):
			return true
		case (.valid,.valid):
			return true
		case (.invalid(let lhsMsg),.invalid(let rhsMsg)):
			return lhsMsg == rhsMsg
		default:
			return false
		}
	}
}
