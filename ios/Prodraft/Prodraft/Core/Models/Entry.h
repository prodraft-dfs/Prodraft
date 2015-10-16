//
//  Entry.h
//  
//
//  Created by Mark Evans on 10/16/15.
//
//

#import <Foundation/Foundation.h>

@interface Entry : NSObject <KCSPersistable>

@property (nonatomic, strong) NSString* EntityId;
@property (nonatomic, strong) NSString* Sport;
@property (nonatomic, strong) NSString* SportId;
@property (nonatomic, strong) NSString* ContestTitle;
@property (nonatomic, strong) NSString* ContestId;
@property (nonatomic, strong) NSString* UserId;
@property (nonatomic, strong) NSString* QB;
@property (nonatomic, strong) NSNumber* RB;
@property (nonatomic, strong) NSNumber* WR;
@property (nonatomic, strong) NSNumber* TE;
@property (nonatomic, strong) NSNumber* FLEX;
@property (nonatomic, strong) NSNumber* ContestType;
@property (nonatomic, strong) NSNumber* ContestStatus;
@property (nonatomic, strong) NSNumber* TotalPoints;
@property (nonatomic, strong) NSNumber* Won;
@property (nonatomic, strong) NSNumber* Entry;
@property (nonatomic, strong) NSNumber* Position;
@property (nonatomic, strong) NSNumber* Entries;
@property (nonatomic, strong) Contest* Contest;

@end
