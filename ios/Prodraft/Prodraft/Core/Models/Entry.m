//
//  Entry.m
//  
//
//  Created by Mark Evans on 10/16/15.
//
//

#import "Entry.h"

@implementation Entry

- (NSDictionary*)hostToKinveyPropertyMapping {
    return @{
             @"EntityId" : KCSEntityKeyId,
             @"Sport" : @"Sport",
             @"SportId" : @"SportId",
             @"ContestTitle" : @"ContestTitle",
             @"ContestId" : @"ContestId",
             @"UserId" : @"UserId",
             @"QB" : @"QB",
             @"RB" : @"RB",
             @"WR" : @"WR",
             @"TE" : @"TE",
             @"FLEX" : @"FLEX",
             @"ContestType" : @"ContestType",
             @"ContestStatus" : @"ContestStatus",
             @"TotalPoints" : @"TotalPoints",
             @"Won" : @"Won",
             @"Entry" : @"Entry",
             @"Position" : @"Position",
             @"Entries" : @"Entries"
             };
}

- (void)setContestId:(NSString *)ContestId {
    _ContestId = ContestId;
    _Contest = nil;
    if (ContestId.length > 0) {
        [[Services sharedInstance] getContests:^(NSArray *success) {
            if (success) {
                for (Contest *c in success) {
                    if (c && c.EntityId) {
                        if ([c.EntityId isEqualToString:ContestId]) {
                            self.Contest = c;
                            break;
                        }
                    }
                }
            }
        }];
    }
}

@end
