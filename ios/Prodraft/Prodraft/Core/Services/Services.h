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

#pragma mark - Shared Properties

@property (nonatomic, strong) KCSUser *currentUser;

#pragma mark - Shared Instance

+ (Services *)sharedInstance;

#pragma mark - API Methods

- (BOOL)checkAuth;
- (void)login:(NSString*)username password:(NSString*)password withSuccess:(void (^)(KCSUser *user))completion;
- (void)getContests:(void (^)(NSArray *success))completion;
- (void)getEntries:(void (^)(NSArray *success))completion;
- (void)getRankingsFrom:(NSString*)pos fromWeek:(NSNumber*)week withOptions:(NSDictionary*)options withSuccess:(void (^)(NSArray *success))completion;
- (void)getStatsfromWeek:(NSNumber*)week fromPosition:(NSString*)pos withOptions:(NSDictionary*)options withSuccess:(void (^)(NSArray *success))completion;

@end
