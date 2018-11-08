//
//  UICollectionView+custom.swift
//  Basic
//
//  Created by Mansoor Ali on 20/08/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import Foundation

public extension UICollectionView{

	public func register<T: UICollectionViewCell>(_ :T.Type, bundle: Bundle = .main) where T: NibLoadableView{
		let nib = UINib(nibName: T.nibName, bundle: bundle)
		register(nib, forCellWithReuseIdentifier: T.reuseId)
	}

	public func register<T: UICollectionViewCell>(_ cellClass :T.Type, bundle: Bundle = .main) {
		register(cellClass, forCellWithReuseIdentifier: cellClass.reuseId)
	}

	public func dequeCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T {
		guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseId, for: indexPath) as? T else {
			fatalError("Could not deque cell with identifier\(T.reuseId)")
		}
		return cell
	}
}
