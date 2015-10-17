//
//  PXView.m
//  PXGradientView
//
//  Created by Calvin Kern on 6/18/15.
//  Copyright (c) 2015 Daniel Blakemore. All rights reserved.
//

#import "PXView.h"
#import <PXGradientView/PXGradientView.h>

@implementation PXView
{
    NSMutableArray* _constraints;
    
    PXGradientView* _gradientView;
    UIButton* _switcherButton;
    
    UIView* _space1;
    UIView* _space2;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) {
        return nil;
    }
    
    _constraints = [NSMutableArray array];
    
    _space1 = [[UIView alloc] init];
    [_space1 setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [self addSubview:_space1];

    _space2 = [[UIView alloc] init];
    [_space2 setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [self addSubview:_space2];

    _gradientView = [[PXGradientView alloc] initWithDefaultGradient:PXDefaultGradientDown];
    [_gradientView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
//    [_gradientView setGradientColors:@[[UIColor colorWithRed:0.333 green:0.937 blue:0.796 alpha:1.0], [UIColor colorWithRed:0.357 green:0.792 blue:1.0 alpha:1.0]]];
    [_gradientView setGradientColors:@[[UIColor redColor], [UIColor greenColor], [UIColor blueColor]]];
    [_gradientView setLocations:@[@0.1, @0.2]];
    [self addSubview:_gradientView];

    _switcherButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_switcherButton setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    [_switcherButton setTitleEdgeInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [_switcherButton setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    [_switcherButton setTitle:@"Switch Gradient" forState:UIControlStateNormal];
    [_switcherButton addTarget:self action:@selector(switchGradientType) forControlEvents:UIControlEventTouchUpInside];
    [[_switcherButton layer] setCornerRadius:5];
    [_switcherButton setClipsToBounds:TRUE];
    [self addSubview:_switcherButton];
    
    [self setNeedsUpdateConstraints];
    return self;
}

- (void)updateConstraints
{
    [self removeConstraints:_constraints];
    [_constraints removeAllObjects];
    
    NSDictionary* views = NSDictionaryOfVariableBindings(_gradientView, _switcherButton, _space1, _space2);
    NSDictionary* metrics = @{@"bw":@160};
    
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_gradientView]|" options:0 metrics:metrics views:views]];
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_space1(_space2)][_switcherButton(bw)][_space2]|" options:0 metrics:metrics views:views]];
    [_constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[_gradientView]|" options:0 metrics:metrics views:views]];
    
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:_switcherButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [_constraints addObject:[NSLayoutConstraint constraintWithItem:_switcherButton attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    
    [self addConstraints:_constraints];
    [super updateConstraints];
}

- (void)switchGradientType
{
    PXGradientDirection direction = [_gradientView gradientDirection];
    switch (direction) {
        case PXGradientDirectionDown:
            direction = PXGradientDirectionLeft;
            break;
        case PXGradientDirectionLeft:
            direction = PXGradientDirectionUp;
            break;
        case PXGradientDirectionRight:
            direction = PXGradientDirectionDown;
            break;
        case PXGradientDirectionUp:
            direction = PXGradientDirectionRight;
            break;
    }

    [_gradientView setGradientDirection:direction];
}

@end
