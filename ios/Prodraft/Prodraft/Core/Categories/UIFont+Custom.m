//  Created by Mark Evans on 9/17/14.
//  Copyright (c) 2014 3Advance, LLC. All rights reserved.
//

#import "UIFont+Custom.h"

@implementation UIFont (Custom)

+ (UIFont *)CustomRegularFontSize:(int)size
{
    return [UIFont fontWithName:kRegularFontName size:size];
}

+ (UIFont *)CustomSemiBoldFontSize:(int)size
{
    return [UIFont fontWithName:kSemiBoldFontName size:size];
}

+ (UIFont *)CustomBoldFontSize:(int)size
{
    return [UIFont fontWithName:kBoldFontName size:size];
}

@end
