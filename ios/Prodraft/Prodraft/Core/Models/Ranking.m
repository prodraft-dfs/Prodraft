//
//  Ranking.m
//  Prodraft
//
//  Created by Mark Evans on 10/15/15.
//  Copyright © 2015 Pro Draft, LLC. All rights reserved.
//

#import "Ranking.h"

@implementation Ranking

- (NSDictionary*)hostToKinveyPropertyMapping {
    return @{
             @"EntityId" : KCSEntityKeyId,
             @"PlayerId" : @"playerId",
             @"Week" : @"week",
             @"Name" : @"name",
             @"Position" : @"position",
             @"Points" : @"points",
             @"Salary" : @"salary",
             @"Team" : @"team",
             };
}

@end
