//
//  Services.m
//  Prodraft
//
//  Created by Mark Evans on 10/15/15.
//  Copyright © 2015 Pro Draft, LLC. All rights reserved.
//

#import "Services.h"
#import <KinveyKit/KinveyKit.h>
#import "Ranking.h"
#import "Stat.h"

@implementation Services

#pragma mark - Shared Instance

+ (Services *)sharedInstance
{
    static Services *sharedInstance;
    
    @synchronized(self)
    {
        if (!sharedInstance)
        {
            sharedInstance = [[Services alloc] init];
            [sharedInstance checkAuth];
        }
        return sharedInstance;
    }
}

#pragma mark - API Methods

- (BOOL)checkAuth {
    if ([KCSUser activeUser]) {
        self.currentUser = [KCSUser activeUser];
        return YES;
    }
    else {
        return NO;
    }
}

- (void)login:(NSString*)username password:(NSString*)password withSuccess:(void (^)(KCSUser *user))completion {
    if (username == nil || username.length == 0) {
        return;
    }
    
    if (password == nil || password.length == 0) {
        return;
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
    [KCSUser loginWithUsername:username password:password withCompletionBlock:^(KCSUser *user, NSError *errorOrNil, KCSUserActionResult result) {
        
        [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
        
        if (result != KCSUserFound && errorOrNil != nil) {
            
            NSString* message = [errorOrNil localizedDescription];
            if (errorOrNil.code == KCSLoginFailureError) {
                message = @"Check that the username and password are correct and try again.";
            }
            
            UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Login"
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];
            
            completion(nil);
        }
        else {
            if (user.emailVerified == NO) {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Login"
                                                                message:@"Email verificaiton is required."
                                                               delegate:nil
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
                [alert show];
                
                completion(nil);
            } else {
                completion(user);
            }
        }
    }];
}

- (void)getContests:(void (^)(NSArray *success))completion {
    KCSQuery* query = [KCSQuery query];
    [[KCSAppdataStore storeWithOptions:@{KCSStoreKeyCollectionName: [NSString stringWithFormat:@"Contests"],
                                         KCSStoreKeyCollectionTemplateClass: [Contest class]}] queryWithQuery:query withCompletionBlock:^(NSArray *success, NSError *error) {
        
        if (error != nil) {
            NSLog(@"An error occurred on fetch: %@", error);
            completion(nil);
        } else {
            if (success && success.count > 0) {
                completion(success);
            }
        }
        
    } withProgressBlock:nil];
}

- (void)getEntries:(void (^)(NSArray *success))completion {
    KCSQuery* query = [KCSQuery query];
    [[KCSAppdataStore storeWithOptions:@{KCSStoreKeyCollectionName: [NSString stringWithFormat:@"Entries"],
                                         KCSStoreKeyCollectionTemplateClass: [Entry class]}] queryWithQuery:query withCompletionBlock:^(NSArray *success, NSError *error) {
        
        if (error != nil) {
            NSLog(@"An error occurred on fetch: %@", error);
            completion(nil);
        } else {
            if (success && success.count > 0) {
                completion(success);
            }
        }
        
    } withProgressBlock:nil];
}

- (void)getRankingsFrom:(NSString*)pos fromWeek:(NSNumber*)week withOptions:(NSDictionary*)options withSuccess:(void (^)(NSArray *success))completion {
    KCSQuery* query = [KCSQuery query];
    [[KCSAppdataStore storeWithOptions:@{KCSStoreKeyCollectionName: [NSString stringWithFormat:@"Rankings%@", pos.uppercaseString],
                                         KCSStoreKeyCollectionTemplateClass: [Ranking class]}] queryWithQuery:query withCompletionBlock:^(NSArray *success, NSError *error) {
        
        if (error != nil) {
            NSLog(@"An error occurred on fetch: %@", error);
            completion(nil);
        } else {
            if (success && success.count > 0) {
                
                NSString *playerId;
                Stat *player;
                if (options) {
                    if (options[@"PlayerId"] != nil) {
                        playerId = (NSString*)options[@"PlayerId"];
                    }
                    if (options[@"Stat"] != nil) {
                        player = (Stat*)options[@"Stat"];
                    }
                }
                
                NSArray *filter_week = [success filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"Week == %@", week.stringValue]];
                if (playerId && playerId.length > 0) {
                    filter_week = [filter_week filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"PlayerId == %@", playerId]];
                }
                if (player && player.Name && player.Name.length > 0) {
                    NSArray* playerNameSet = [player.Name componentsSeparatedByString:@"."];
                    filter_week = [filter_week filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"Name CONTAINS[cd] %@", playerNameSet[1]]];
                }
                NSMutableArray* sort_salary = [[NSMutableArray alloc] initWithArray:filter_week];
                [sort_salary sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"Salary" ascending:NO]]];
                
                NSMutableArray *array = [NSMutableArray new];
                for (Ranking *p in sort_salary) {
                    Ranking *pp = [Ranking new];
                    pp = p;
                    pp.Stat = player;
                    [array addObject:pp];
                }
                completion(array);
            }
        }
        
    } withProgressBlock:nil];
}

- (void)getStatsfromWeek:(NSNumber*)week fromPosition:(NSString*)pos withOptions:(NSDictionary*)options withSuccess:(void (^)(NSArray *success))completion {
    KCSQuery* query = [KCSQuery query];
    [[KCSAppdataStore storeWithOptions:@{KCSStoreKeyCollectionName: @"Stats",
                                         KCSStoreKeyCollectionTemplateClass: [Stat class]}] queryWithQuery:query withCompletionBlock:^(NSArray *success, NSError *error) {
        
        if (error != nil) {
            NSLog(@"An error occurred on fetch: %@", error);
            completion(nil);
        } else {
            if (success && success.count > 0) {
                
                Ranking *player;
                if (options) {
                    if (options[@"Ranking"] != nil) {
                        player = (Ranking*)options[@"Ranking"];
                    }
                }
                
                NSArray *filter_week = [success filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"Week == %i", week.intValue]];
                if (pos && pos.length) {
                    filter_week = [filter_week filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"Position == %@", pos.uppercaseString]];
                }
                if (player && player.Name && player.Name.length > 0) {
                    NSArray* playerNameSet = [player.Name componentsSeparatedByString:@" "];
                    filter_week = [filter_week filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"Name CONTAINS[cd] %@", playerNameSet[1]]];
                }
                NSMutableArray* sort_points = [[NSMutableArray alloc] initWithArray:filter_week];
                [sort_points sortUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"Points" ascending:NO]]];
                
                NSMutableArray *array = [NSMutableArray new];
                for (Stat *p in sort_points) {
                    Stat *pp = [Stat new];
                    pp = p;
                    pp.Ranking = player;
                    [array addObject:pp];
                }
                completion(array);
            }
        }
        
    } withProgressBlock:nil];
}

@end
