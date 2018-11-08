//
//  ResponseError.swift
//  Basic
//
//  Created by Mansoor Ali on 05/09/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import UIKit

public class ResponseError {
	public var title: String
	public var reason: String
	public var statusCode: Int
	public var customErrorCode: Int

	public init() {
		title = ""
		reason = ""
		statusCode = 0
		customErrorCode = 0
	}
}
