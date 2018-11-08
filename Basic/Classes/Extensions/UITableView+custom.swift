//
//  UITableView.swift
//  Basic
//
//  Created by Mansoor Ali on 20/08/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import Foundation

public extension UITableView{
	public func register<T: UITableViewCell>(_ :T.Type, bundle: Bundle = .main) where T: NibLoadableView{
		let nib = UINib(nibName: T.nibName, bundle: bundle)
//        print("Cell Registration  Nib:\(T.nibName),reuseId:\(T.reuseId)")
		register(nib, forCellReuseIdentifier: T.reuseId)
	}

	public func register<T: UITableViewCell>(_ cellClass :T.Type, bundle: Bundle = .main) {
//        print("Cell Registration  reuseId:\(T.reuseId)")
		register(cellClass, forCellReuseIdentifier: cellClass.reuseId)
	}

	public func dequeCell<T: UITableViewCell>(indexPath:IndexPath) -> T{
        
//        print("Cell Dequeue reuseId:\(T.reuseId)")
		guard  let cell = dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as? T else {
			fatalError("Could not deque cell with identifier:\(T.reuseId)")
		}
		return cell
	}


	public func scrollPecentage() -> CGFloat {
		let height = self.contentSize.height - self.frame.size.height
		let scrolledPercentage = self.contentOffset.y / height
		return scrolledPercentage
	}
}
