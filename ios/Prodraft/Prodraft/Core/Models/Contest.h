//
//  Contest.h
//  
//
//  Created by Mark Evans on 10/16/15.
//
//

#import <Foundation/Foundation.h>

@interface Contest : NSObject <KCSPersistable>

@property (nonatomic, strong) NSString* EntityId;
@property (nonatomic, strong) NSString* Sport;
@property (nonatomic, strong) NSString* SportId;
@property (nonatomic, strong) NSString* Title;
@property (nonatomic, strong) NSString* InviteCode;
@property (nonatomic, strong) NSString* StartDate;
@property (nonatomic, strong) NSString* EndDate;
@property (nonatomic, strong) NSNumber* ScheduleType;
@property (nonatomic, strong) NSNumber* Type;
@property (nonatomic, strong) NSNumber* Entry;
@property (nonatomic, strong) NSNumber* Entries;
@property (nonatomic, strong) NSNumber* Prizes;
@property (nonatomic, strong) NSNumber* MaxEntries;
@property (nonatomic, strong) NSNumber* Entered;
@property (nonatomic, strong) NSNumber* MultiEntry;
@property (nonatomic, strong) NSNumber* Guaranteed;
@property (nonatomic, strong) NSNumber* ContestStatus;

@end
