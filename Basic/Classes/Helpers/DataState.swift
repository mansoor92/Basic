//
//  DataState.swift
//  Basic
//
//  Created by Mansoor Ali on 26/10/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import Foundation

public enum DataState {
	case idle
	case loading
	case loaded
	case error(ResponseError)
}
