//
//  Stat.h
//  Prodraft
//
//  Created by Mark Evans on 10/16/15.
//  Copyright © 2015 Pro Draft, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Ranking;

@interface Stat : NSObject <KCSPersistable>

@property (nonatomic, strong) NSString* EntityId;
@property (nonatomic, strong) NSString* Week;
@property (nonatomic, strong) NSString* PlayerId;
@property (nonatomic, strong) NSString* Name;
@property (nonatomic, strong) NSString* Position;
@property (nonatomic, strong) NSNumber* Points;
@property (nonatomic, strong) NSNumber* RushingYards;
@property (nonatomic, strong) NSNumber* Team;
@property (nonatomic, strong) Ranking* Ranking;

@end