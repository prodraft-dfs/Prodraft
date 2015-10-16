//
//  Contest.m
//  
//
//  Created by Mark Evans on 10/16/15.
//
//

#import "Contest.h"

@implementation Contest

- (NSDictionary*)hostToKinveyPropertyMapping {
    return @{
             @"EntityId" : KCSEntityKeyId,
             @"Sport" : @"Sport",
             @"SportId" : @"SportId",
             @"Title" : @"Title",
             @"InviteCode" : @"InviteCode",
             @"StartDate" : @"StartDate",
             @"EndDate" : @"EndDate",
             @"ScheduleType" : @"ScheduleType",
             @"Type" : @"Type",
             @"Entry" : @"Entry",
             @"Entries" : @"Entries",
             @"Prizes" : @"Prizes",
             @"MaxEntries" : @"MaxEntries",
             @"Entered" : @"Entered",
             @"MultiEntry" : @"MultiEntry",
             @"Guaranteed" : @"Guaranteed",
             @"ContestStatus" : @"ContestStatus",
             };
}

@end
