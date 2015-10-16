//
//  Services.h
//  Prodraft
//
//  Created by Mark Evans on 10/15/15.
//  Copyright © 2015 Pro Draft, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <KinveyKit/KinveyKit.h>

@class Ranking;

@interface Services : NSObject

@property (nonatomic, strong) KCSUser *currentUser;

+ (Services *)sharedInstance;
- (void)checkAuth;
- (void)login:(NSString*)username password:(NSString*)password withSuccess:(void (^)(KCSUser *user))completion;
- (void)getRankingsFrom:(NSString*)pos fromWeek:(NSNumber*)week withOptions:(NSDictionary*)options withSuccess:(void (^)(NSArray *success))completion;
- (void)getStatsfromWeek:(NSNumber*)week fromPosition:(NSString*)pos withOptions:(NSDictionary*)options withSuccess:(void (^)(NSArray *success))completion;

@end
