//
//  ShimmerView.swift
//  TemplateProject
//
//  Created by Mansoor Ali on 25/10/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import UIKit

class ShimmerView: ProgressView {
/*
	private struct ShimmerProperties {
		static let shimmerKey:String = "io.monroy.shimmer.key"
		static var lightColor:CGColor = UIColor.white.withAlphaComponent(0.1).cgColor
		static var darkColor:CGColor = UIColor.black.withAlphaComponent(0.9).cgColor
		static var isShimmering:Bool = false
		static var gradient:CAGradientLayer = CAGradientLayer()
		static var animation:CABasicAnimation = CABasicAnimation(keyPath: "locations")
	}*/

	public var lightColor: CGColor = UIColor.white.withAlphaComponent(0.1).cgColor
	public var darkColor: CGColor = UIColor.black.withAlphaComponent(1).cgColor
	private var gradient: CAGradientLayer = CAGradientLayer()
	private var animation: CABasicAnimation = CABasicAnimation(keyPath: "locations")
	public var isShimmering: Bool = false
	private let shimmerKey:String = "com.incubasys.btq.shimmer.key"

	private var imageView: UIImageView!
	public var image: UIImage? {
		didSet{
			guard imageView != nil else { return }
			imageView.image = image
		}
	}

	override public func customizeUI() {
		self.backgroundColor = UIColor.white
		imageView = UIImageView(frame: .zero)
		imageView.image = image
		imageView.contentMode = .scaleAspectFit
		add(imageView: imageView, to: self)
//		self.sendSubview(toBack: imageView)
	}


	private func add(imageView child: UIImageView, to parent: UIView) {
		child.translatesAutoresizingMaskIntoConstraints = false
		parent.addSubview(child)

		child.topAnchor.constraint(equalTo: parent.topAnchor).isActive = true
		parent.bottomAnchor.constraint(equalTo: child.bottomAnchor).isActive = true
		child.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive = true
		parent.trailingAnchor.constraint(equalTo: child.trailingAnchor).isActive = true
	}

	private func stopShimmerAnimation() {
		guard isShimmering else {return}
		imageView.layer.mask?.removeAnimation(forKey: shimmerKey)
		imageView.layer.mask = nil
		isShimmering = false
		imageView.layer.setNeedsDisplay()
	}

	private func startShimmerAnimation(count: Int = 3) {
		guard !isShimmering else {return}

		CATransaction.begin()
		CATransaction.setCompletionBlock({
			self.stopShimmerAnimation()
		})

		isShimmering = true

		gradient.colors = [darkColor, lightColor, darkColor];
		gradient.frame = CGRect(x: CGFloat(-2*imageView.bounds.size.width), y: CGFloat(0.0), width: CGFloat(4*imageView.bounds.size.width), height: CGFloat(imageView.bounds.size.height))
		gradient.startPoint = CGPoint(x: Double(0.0), y: Double(0.5));
		gradient.endPoint = CGPoint(x: Double(1.0), y: Double(0.5));
		gradient.locations = [0.4, 0.5, 0.6];

		animation.duration = 1.5
		animation.repeatCount = (count > 0) ? Float(count) : .infinity
		animation.fromValue = [0.0, 0.12, 0.3]
		animation.toValue = [0.6, 0.86, 1.0]

		gradient.add(animation, forKey: shimmerKey)
		imageView.layer.mask = gradient

		CATransaction.commit()
	}

	override public func playAnimation() {
		super.playAnimation()
		startShimmerAnimation(count: -1)
	}

	override public func stopAnimation() {
		super.stopAnimation()
		stopShimmerAnimation()
	}
}
