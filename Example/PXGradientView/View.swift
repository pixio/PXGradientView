//
//  DemoView.swift
//  PXImageView
//
//  Created by Dave Heyborne on 2.17.16.
//  Copyright © 2016 Dave Heyborne. All rights reserved.
//

import UIKit

class View: UIView {
    private var _constraints: [NSLayoutConstraint]
    private let _gradientView: PXGradientView
    private let _switcherButton: UIButton
    private let _space1: UIView
    private let _space2: UIView
    
    override init(frame: CGRect) {
        _constraints = []
        _gradientView = PXGradientView(defaultGradient: PXDefaultGradient.Down)
        _switcherButton = UIButton(type: UIButtonType.RoundedRect)
        _space1 = UIView()
        _space2 = UIView()
        super.init(frame: frame)
        
        _space1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_space1)
        
        _space2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_space2)
        
        _gradientView.translatesAutoresizingMaskIntoConstraints = false
        _gradientView.gradientColors = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor()]
        _gradientView.locations = [0.1, 0.2]
        addSubview(_gradientView)
        
        _switcherButton.translatesAutoresizingMaskIntoConstraints = false
        _switcherButton.titleEdgeInsets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)
        _switcherButton.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        _switcherButton.setTitle("Switch Gradient", forState: UIControlState.Normal)
        _switcherButton.addTarget(self, action: "switchGradientType", forControlEvents: UIControlEvents.TouchUpInside)
        _switcherButton.layer.cornerRadius = 5.0
        _switcherButton.clipsToBounds = true
        addSubview(_switcherButton)
        
        setNeedsUpdateConstraints()
    }
    
    // NOT IMPLEMENTED
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        removeConstraints(_constraints)
        _constraints.removeAll()
        
        let views: [String : UIView] = ["_gradientView" : _gradientView, "_switcherButton" : _switcherButton, "_space1" : _space1, "_space2" : _space2]
        let metrics: [String : Int] = ["buttonWidth" : 160]
        
        _constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[_gradientView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
        _constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("H:|[_space1(_space2)][_switcherButton(buttonWidth)][_space2]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
        _constraints.appendContentsOf(NSLayoutConstraint.constraintsWithVisualFormat("V:|[_gradientView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
        
        _constraints.append(NSLayoutConstraint(item: _switcherButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0))
        _constraints.append(NSLayoutConstraint(item: _switcherButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0))
        
        addConstraints(_constraints)
        super.updateConstraints()
    }
    
    func switchGradientType() {
        switch _gradientView.gradientDirection {
        case PXGradientDirection.Down:
            _gradientView.gradientDirection = PXGradientDirection.Left
        case PXGradientDirection.Left:
            _gradientView.gradientDirection = PXGradientDirection.Up
        case PXGradientDirection.Right:
            _gradientView.gradientDirection = PXGradientDirection.Down
        case PXGradientDirection.Up:
            _gradientView.gradientDirection = PXGradientDirection.Right
        }
    }
}
