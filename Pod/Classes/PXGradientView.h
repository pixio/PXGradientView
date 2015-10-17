//
//  PXGradientView.h
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

#import <UIKit/UIKit.h>

/**
 *  The default gradients that can be used instead of setting the gradientColors property.
 */
typedef NS_ENUM(NSInteger, PXDefaultGradient)
{
    /**
     *  Vertical gradient from transparent (top) to partially transparent black (bottom).
     *
     *  Uses PXGradientDirectionUp.
     */
    PXDefaultGradientUp,
    /**
     *  Vertical gradient from partially transparent black (top) to transparent (bottom).
     *
     *  Uses PXGradientDirectionDown.
     */
    PXDefaultGradientDown,
};

/**
 *  The direction of the gradient.
 */
typedef NS_ENUM(NSInteger, PXGradientDirection)
{
    /**
     *  Colors from color array used from the bottom to the top of the gradient.
     */
    PXGradientDirectionUp,
    /**
     *  Colors from color array used from the top to the bottom of the gradient.
     */
    PXGradientDirectionDown,
    /**
     *  Colors from color array used from the right to the left side of the gradient.
     */
    PXGradientDirectionLeft,
    /**
     *  Colors from color array used from the left to the right side of the gradient.
     */
    PXGradientDirectionRight,
};

/**
 *  A view with a linear gradient with the specified colors.  Basically a CAGradientLayer packed as a view.
 */
@interface PXGradientView : UIView

/**
 *  The colors to use in the gradient.  This is simply an array of UIColors.
 */
@property (nonatomic) NSArray * gradientColors;

/**
 *  The direction the gradient gradates.
 */
@property (nonatomic) PXGradientDirection gradientDirection;

/**
 *  The points to use along the gradient.  If this property is nil, the colors are evenly spaced across the gradient.
 */
@property (nonatomic) NSArray * locations;

/**
 *  Make a gradient view with a specified default gradient.  This creates a gradient without having to set the
 *  gradientColors property.
 *
 *  @param defaultGradient which default gradient to use
 *
 *  @return a pre-initialized gradient view
 */
- (instancetype)initWithDefaultGradient:(PXDefaultGradient)defaultGradient;

/**
 *  Reset the gradient color and location arrays to empty.
 */
- (void)resetColorState;

/**
 *  Resets the location arrary to empty.  Colors will revert back to default equal weights.
 */
- (void)removeAllLocations;

@end
