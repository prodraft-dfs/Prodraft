//  Created by Mark Evans on 9/15/14.
//  Copyright (c) 2014 3Advance, LLC. All rights reserved.
//

#import "UIColor+Custom.h"

@implementation UIColor (Custom)

+ (UIColor *)CustomGreenColor
{
    return [UIColor colorWithHex:0x22823d];
}

+ (UIColor *)CustomBlueColor
{
    return [UIColor colorWithHex:0x0295cc];
}

+ (UIColor *)CustomNavGrayColor
{
    return [UIColor colorWithHex:0x282828];
}

+ (UIColor *)CustomTabGrayColor
{
    return [UIColor colorWithHex:0x282828];
}

+ (UIColor *)CustomGrayBackgroundColor
{
    return [UIColor colorWithGradientStyle:UIGradientStyleTopToBottom
                                 withFrame:(CGRect){0,64,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height}
                                 andColors:@[[UIColor colorWithHex:0x202020], [UIColor colorWithHex:0x282828]]];
}

+ (UIColor *)CustomBackgroundGrayColorStart
{
    return [UIColor colorWithHex:0x202020];
}

+ (UIColor *)CustomBackgroundGrayColorStop
{
    return [UIColor colorWithHex:0x252525];
}

+ (UIColor *)CustomBackgroundOffBlackColor
{
    return [UIColor colorWithHex:0x151515];
}

+ (UIColor *)CustomLineGrayColor
{
    return [UIColor colorWithHex:0x333333];
}

+ (UIColor *)CustomRedColor
{
    return [UIColor colorWithHex:0xf23f46];
}

@end
