//
//  DemoView.swift
//  PXImageView
//
//  Created by Dave Heyborne on 2.17.16.
//  Copyright © 2016 Dave Heyborne. All rights reserved.
//

import UIKit

class View: UIView {
    fileprivate var _constraints: [NSLayoutConstraint]
    fileprivate let _gradientView: PXGradientView
    fileprivate let _switcherButton: UIButton
    fileprivate let _space1: UIView
    fileprivate let _space2: UIView
    
    override init(frame: CGRect) {
        _constraints = []
        _gradientView = PXGradientView(defaultGradient: PXDefaultGradient.down)
        _switcherButton = UIButton(type: UIButtonType.roundedRect)
        _space1 = UIView()
        _space2 = UIView()
        super.init(frame: frame)
        
        _space1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_space1)
        
        _space2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(_space2)
        
        _gradientView.translatesAutoresizingMaskIntoConstraints = false
        _gradientView.gradientColors = [UIColor.red, UIColor.green, UIColor.blue]
        _gradientView.locations = [0.1, 0.2]
        addSubview(_gradientView)
        
        _switcherButton.translatesAutoresizingMaskIntoConstraints = false
        _switcherButton.titleEdgeInsets = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0)
        _switcherButton.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
        _switcherButton.setTitle("Switch Gradient", for: UIControlState())
        _switcherButton.addTarget(self, action: #selector(View.switchGradientType), for: UIControlEvents.touchUpInside)
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
        
        _constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[_gradientView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
        _constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "H:|[_space1(_space2)][_switcherButton(buttonWidth)][_space2]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
        _constraints.append(contentsOf: NSLayoutConstraint.constraints(withVisualFormat: "V:|[_gradientView]|", options: NSLayoutFormatOptions(rawValue: 0), metrics: metrics, views: views))
        
        _constraints.append(NSLayoutConstraint(item: _switcherButton, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerX, multiplier: 1.0, constant: 0.0))
        _constraints.append(NSLayoutConstraint(item: _switcherButton, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: self, attribute: NSLayoutAttribute.centerY, multiplier: 1.0, constant: 0.0))
        
        addConstraints(_constraints)
        super.updateConstraints()
    }
    
    func switchGradientType() {
        switch _gradientView.gradientDirection {
        case PXGradientDirection.down:
            _gradientView.gradientDirection = PXGradientDirection.left
        case PXGradientDirection.left:
            _gradientView.gradientDirection = PXGradientDirection.up
        case PXGradientDirection.right:
            _gradientView.gradientDirection = PXGradientDirection.down
        case PXGradientDirection.up:
            _gradientView.gradientDirection = PXGradientDirection.right
        }
    }
}
