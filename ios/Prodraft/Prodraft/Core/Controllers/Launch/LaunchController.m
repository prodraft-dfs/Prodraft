//
//  LaunchController.m
//  Prodraft
//
//  Created by Mark Evans on 10/15/15.
//  Copyright © 2015 Pro Draft, LLC. All rights reserved.
//

#import "LaunchController.h"
#import "Services.h"
#import <KinveyKit/KinveyKit.h>
#import "Ranking.h"
#import "Stat.h"

@interface LaunchController ()

@end

@implementation LaunchController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupLogo];
    
    NSLog(@"Boom!");
    
    if ([Services sharedInstance].currentUser) {
        NSLog(@"Logged In");
        
        Stat *p = [Stat new];
        p.Name = @"D.Brees";
        p.Points = @18.68;
        p.PlayerId = @"14";
        
        NSDictionary *options = @{@"Stat":p};
        options = @{@"PlayerId":@"14"};
        options = nil;
        
        [[Services sharedInstance] getRankingsFrom:@"QB" fromWeek:@6 withOptions:options withSuccess:^(NSArray *success) {
            if (success) {
                int index = 0;
                for (Ranking *player in success) {
                    if (player) {
                        if (player.Stat) {
                            NSLog(@"ranking: %@ - %@ (%@) -- (%@)", player.Name, player.Points, player.Salary, player.Stat.Points);
                        }
                        else {
                            NSLog(@"ranking: %@ - %@ (%@)", player.Name, player.Points, player.Salary);
                        }
                    }
                    index++;
                }
            }
        }];
        
        Ranking *pp = [Ranking new];
        pp.Name = @"Drew Brees";
        pp.Points = @19.6;
        pp.Salary = @9100;
        pp.PlayerId = @"14";
        
        NSDictionary *option = @{@"Ranking":pp};
        option = nil;
        
        [[Services sharedInstance] getStatsfromWeek:@6 fromPosition:nil withOptions:option withSuccess:^(NSArray *success) {
            if (success) {
                int index = 0;
                for (Stat *player in success) {
                    if (player) {
                        if (player.Ranking) {
                            NSLog(@"stat: %@ - %@ (%@) -- (%@)", player.Ranking.Name, player.Ranking.Points, player.Ranking.Salary, player.Points);
                        }
                        else {
                            NSLog(@"stat: %@ - (%@)", player.Name, player.Points);
                        }
                    }
                    index++;
                }
            }
        }];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
