//
//  NSDate+NSDateCategory.h
//
//  Created by Paul Murphy on 12/20/12.
//  Copyright (c) 2012 3Advance. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (NSDateCategory)

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day;

+ (NSDate *)dateWithYear:(NSInteger)year month:(NSInteger)month day:(NSInteger)day andHour:(NSInteger)hour andMinute:(NSInteger)minute;

+ (NSString *)humanDateTime:(NSDate*)date;
+ (NSString *)regularDateTime:(NSDate*)date;
+ (NSString *)wordyDate:(NSDate*)date;

- (NSString*)formattedDate:(NSString*)formatString;

-(int)second;
-(int)minute;
-(int)hour;
-(int)day;
-(int)month;
-(int)year;
-(NSString*)suffix;

-(NSDate *)toLocalTime;
-(NSDate *)toGlobalTime;

@end