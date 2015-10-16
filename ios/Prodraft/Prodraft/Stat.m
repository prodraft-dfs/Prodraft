//
//  Stat.m
//  Prodraft
//
//  Created by Mark Evans on 10/16/15.
//  Copyright © 2015 Pro Draft, LLC. All rights reserved.
//

#import "Stat.h"

@implementation Stat

- (NSDictionary*)hostToKinveyPropertyMapping {
    return @{
             @"EntityId" : KCSEntityKeyId,
             @"Week" : @"week",
             @"Name" : @"name",
             @"Position" : @"pos",
             @"Points" : @"points",
             @"RushingYards" : @"rushing_yds",
             @"Team" : @"team",
             };
}

@end