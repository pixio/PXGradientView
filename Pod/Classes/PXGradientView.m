//
//  PXGradientView.m
//
//  Created by Daniel Blakemore on 5/21/14.
//
//  Copyright (c) 2015 Pixio
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "PXGradientView.h"

#import <UIColor-MoreColors/UIColor+MoreColors.h>

@implementation PXGradientView
{
    CAGradientLayer * _gradientLayer;
}

- (instancetype)initWithDefaultGradient:(PXDefaultGradient)defaultGradient
{
    self = [self initWithFrame:CGRectZero];
    if (self) {
        // Initialization code
        switch (defaultGradient) {
            case PXDefaultGradientUp:
                [self setGradientColors:@[[UIColor oneQuarterTransparentBlack], [UIColor clearColor]]];
                [self setGradientDirection:PXGradientDirectionUp];
                break;
            
            case PXDefaultGradientDown:
            default:
                [self setGradientColors:@[[UIColor oneQuarterTransparentBlack], [UIColor clearColor]]];
                [self setGradientDirection:PXGradientDirectionDown];
                break;
        }
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _gradientLayer = [[CAGradientLayer alloc] init];
        [_gradientLayer setFrame:CGRectMake(0, 0, 10, 10)];
        [[self layer] addSublayer:_gradientLayer];
    }
    return self;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    if (layer == [self layer]) {
        [super layoutSublayersOfLayer:layer];
        [_gradientLayer setFrame:[self bounds]];
    }
}

#pragma mark - setters

- (void)setGradientColors:(NSArray *)gradientColors
{
    _gradientColors = gradientColors;
    
    NSMutableArray * colorsBecauseUICachedDeviceWhiteColorIsntKeyValueCodingCompliantAndIStillWantANiceInterface = [NSMutableArray array];
    
    for (UIColor * color in _gradientColors) {
        [colorsBecauseUICachedDeviceWhiteColorIsntKeyValueCodingCompliantAndIStillWantANiceInterface addObject:(id)[color CGColor]];
    }
    
    [_gradientLayer setColors:colorsBecauseUICachedDeviceWhiteColorIsntKeyValueCodingCompliantAndIStillWantANiceInterface];
}

- (void)setGradientDirection:(PXGradientDirection)gradientDirection
{
    _gradientDirection = gradientDirection;
    
    switch (_gradientDirection) {
        case PXGradientDirectionUp: {
            [_gradientLayer setStartPoint:CGPointMake(0.5, 0.0)];
            [_gradientLayer setEndPoint:CGPointMake(0.5, 1.0)];
            break;
        }
            
        case PXGradientDirectionDown: {
            [_gradientLayer setStartPoint:CGPointMake(0.5, 1.0)];
            [_gradientLayer setEndPoint:CGPointMake(0.5, 0.0)];
            break;
        }
            
        case PXGradientDirectionLeft: {
            [_gradientLayer setStartPoint:CGPointMake(1.0, 0.5)];
            [_gradientLayer setEndPoint:CGPointMake(0.0, 0.5)];
            break;
        }
            
        case PXGradientDirectionRight:
        default: {
            [_gradientLayer setStartPoint:CGPointMake(0.0, 0.5)];
            [_gradientLayer setEndPoint:CGPointMake(1.0, 0.5)];
            break;
        }
    }
}

- (void)setLocations:(NSArray *)locations
{
    _locations = locations;
    
    [_gradientLayer setLocations:_locations];
}

- (void)resetColorState
{
    [self setGradientColors:@[]];
    [self removeAllLocations];
}

- (void)removeAllLocations;
{
    [self setLocations:nil];
}

@end



