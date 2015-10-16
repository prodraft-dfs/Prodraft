//
//  Ranking.h
//  Prodraft
//
//  Created by Mark Evans on 10/15/15.
//  Copyright © 2015 Pro Draft, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KinveyKit/KinveyKit.h>
#import "Stat.h"

@class Stat;

@interface Ranking : NSObject <KCSPersistable>

@property (nonatomic, strong) NSString* EntityId;
@property (nonatomic, strong) NSString* Week;
@property (nonatomic, strong) NSString* PlayerId;
@property (nonatomic, strong) NSString* Name;
@property (nonatomic, strong) NSString* Position;
@property (nonatomic, strong) NSNumber* Points;
@property (nonatomic, strong) NSNumber* Salary;
@property (nonatomic, strong) NSString* Team;
@property (nonatomic, strong) Stat* Stat;

@end