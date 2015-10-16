//  Created by Mark Evans on 9/15/14.
//  Copyright (c) 2014 3Advance, LLC. All rights reserved.
//

#import "UIImage+Custom.h"

@implementation UIImage (Custom)

+ (UIImage *)CustomLogo
{
    return [UIImage imageNamed:@"logo"];
}

+ (UIImage *)CustomNavLogo
{
    return [UIImage imageNamed:@"nav-logo"];
}

+ (UIImage *)TabOne
{
    return [UIImage imageNamed:@"tab-home"];
}

+ (UIImage *)TabTwo
{
    return [UIImage imageNamed:@"tab-contests"];
}

+ (UIImage *)TabThree
{
    return [UIImage imageNamed:@"tab-profile"];
}

+ (UIImage *)TabFour
{
    return [UIImage imageNamed:@"tab-more"];
}

@end
