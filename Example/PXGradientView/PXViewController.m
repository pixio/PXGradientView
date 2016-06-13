//
//  PXViewController.m
//  PXGradientView
//
//  Created by Daniel Blakemore on 05/01/2015.
//  Copyright (c) 2014 Daniel Blakemore. All rights reserved.
//

#import "PXView.h"
#import "PXViewController.h"

@interface PXViewController ()

@end

@implementation PXViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (PXView*)contentView
{
    return (PXView*)[self view];
}

- (void)loadView
{
    [self setView:[[PXView alloc] init]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setTitle:@"PX Gradient View"];
    [[self view] setBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1.0]];
    
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    
    [[[self navigationController] navigationBar] setBarTintColor:[UIColor orangeColor]];
    [[[self navigationController] navigationBar] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}

@end
