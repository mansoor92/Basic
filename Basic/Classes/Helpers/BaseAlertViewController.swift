//
//  BaseAlertViewController.swift
//  Basic
//
//  Created by Mansoor Ali on 06/09/2018.
//  Copyright © 2018 Mansoor Ali. All rights reserved.
//

import UIKit

open class BaseAlertViewController: UIViewController {

	//Mark: Properties
	public var blurEffectView: UIVisualEffectView!
	public var titleLabel: UILabel!
	public var msgLabel: UILabel!
	public var actionsStackView: UIStackView!

	public var alertTitle: String?
	public var alertMsg: String?
//	public var actions = [CustomAlertAction]()
	public var actions = [UIButton]()
	public var additionalContentView = UIView()
	public var additionalContentViewHeight: NSLayoutConstraint!


	//MARK: Lifecycle
	override open func viewDidLoad() {
		super.viewDidLoad()
		customizeUI()
		configure()
	}

	//MARK: UI
	open func customizeUI(){

		view.backgroundColor = UIColor.black.withAlphaComponent(0.5)

		blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: UIBlurEffectStyle.light))
		titleLabel = UILabel(frame: .zero)
		msgLabel = UILabel(frame: .zero)
		blurEffectView.contentView.addSubview(msgLabel)
		if !actions.isEmpty{
//			actionsStackView = UIStackView(arrangedSubviews: getViews(forActions: actions))
			actionsStackView = UIStackView(arrangedSubviews: actions)
			blurEffectView.contentView.addSubview(actionsStackView)
		}

		setupBlurEffectView()

		setupTitleLabel()
		blurEffectView.contentView.addSubview(additionalContentView)
		setupMsgLabel()
		setupAdditionContentView()
		if !actions.isEmpty{
			actionsStackView.alignment = .fill
			actionsStackView.distribution = .fillEqually
			add(stackView: actionsStackView, to: blurEffectView.contentView,
				topAlignTo: additionalContentView, forNoOfButtons: actions.count)
		}
	}

	private func getViews(forActions alertActions: [CustomAlertAction]) -> [UIView]{
		var actionViews = [UIView]()
		for action in alertActions{
			actionViews.append(action.customAlertActionView())
		}
		return actionViews
	}

	private func setupBlurEffectView(){
		add(blurEffectView: blurEffectView, to: self.view)
		blurEffectView.layer.cornerRadius = 6
		blurEffectView.clipsToBounds = true
	}

	private func setupTitleLabel(){
		titleLabel.textAlignment = .center
		titleLabel.numberOfLines = 0
		add(titleView: titleLabel, to: blurEffectView.contentView,
			bottomAlignTo: msgLabel, alertMsg: alertMsg)
	}

	private func setupMsgLabel(){
		msgLabel.textAlignment = .center
		msgLabel.numberOfLines = 0
//		var bottomView: UIView?
//		if actions.isEmpty{
//			bottomView = blurEffectView.contentView
//		}
		add(msgView: msgLabel, to: blurEffectView.contentView,bottomAlignTo: additionalContentView, alertMsg: alertMsg)
	}

	private func setupAdditionContentView(){
		var bottomView: UIView?
		if actions.isEmpty{
			bottomView = blurEffectView.contentView
		}
		add(additionalContentView: additionalContentView, to: blurEffectView.contentView, bottomAlignTo: bottomView)
	}

	private func add(blurEffectView view: UIVisualEffectView, to superView: UIView){
		superView.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.topAnchor.constraint(greaterThanOrEqualTo: superView.topAnchor, constant: 64).isActive = true
		superView.bottomAnchor.constraint(greaterThanOrEqualTo: view.bottomAnchor, constant: 64).isActive = true
		view.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 64).isActive = true
		superView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 64).isActive = true
		view.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
	}

	private func add(titleView view: UILabel, to superView: UIView, bottomAlignTo: UIView, alertMsg: String?){
		superView.addSubview(view)
		view.translatesAutoresizingMaskIntoConstraints = false
		view.topAnchor.constraint(equalTo: superView.topAnchor, constant: 20).isActive = true
		if let msg = alertMsg, !msg.isEmpty{
			bottomAlignTo.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 12).isActive = true
		}else{
			bottomAlignTo.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
		}
		view.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 12).isActive = true
		superView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 12).isActive = true
		view.heightAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
	}

	private func add(msgView view: UILabel, to superView: UIView, bottomAlignTo: UIView, alertMsg: String?){
		view.translatesAutoresizingMaskIntoConstraints = false
		bottomAlignTo.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
		view.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		view.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
		if let msg = alertMsg, !msg.isEmpty{
			view.heightAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
		}else{
			view.heightAnchor.constraint(lessThanOrEqualToConstant: 0).isActive = true
		}
	}


	private func add(additionalContentView view: UIView, to superView: UIView,
					 bottomAlignTo bottomView: UIView?){
		view.translatesAutoresizingMaskIntoConstraints = false

		view.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
		bottomView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
		additionalContentViewHeight = view.heightAnchor.constraint(equalToConstant: 0)
		additionalContentViewHeight.isActive = true
	}

	private func add(stackView view: UIStackView, to superView: UIView,
					 topAlignTo topView: UIView, forNoOfButtons noOfButtons: Int){
		if noOfButtons == 2{
			view.spacing = 16
			view.axis = .horizontal
		}else{
			view.spacing = 12
			view.axis = .vertical
		}
		view.translatesAutoresizingMaskIntoConstraints = false
		view.arrangedSubviews.first?.heightAnchor.constraint(equalToConstant: 40).isActive = true
		view.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 20).isActive = true
		superView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 12).isActive = true
		view.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
		view.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
	}

	//MARK: Data
	private func configure(){
		titleLabel.text = alertTitle
		msgLabel.text = alertMsg
	}

}
