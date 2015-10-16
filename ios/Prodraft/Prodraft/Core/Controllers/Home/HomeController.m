//
//  HomeController.m
//  
//
//  Created by Mark Evans on 10/16/15.
//
//

#import "HomeController.h"
#import "DZNSegmentedControl.h"
#import "EntryCell.h"

@interface HomeController () <DZNSegmentedControlDelegate>
{
    IBOutlet UILabel *noEntries;
}
@property (nonatomic, strong) DZNSegmentedControl *control;
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSMutableArray *entries;
@property (nonatomic, strong) NSMutableArray *live;
@property (nonatomic, strong) NSMutableArray *upcoming;
@property (nonatomic, strong) NSMutableArray *archive;
@end

@implementation HomeController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Home";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Home" image:[UIImage TabOne] tag:1];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadEntries];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupLogo];
    self.menuItems = @[[@"Live" uppercaseString], [@"Upcoming" uppercaseString], [@"Archive" uppercaseString]];
    self.tableView.tableHeaderView = self.control;
    [self.control setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Custom Methods

- (void)loadEntries {
    [[Services sharedInstance] getEntries:^(NSArray *success) {
        if (success) {
            self.entries = [NSMutableArray new];
            self.live = [NSMutableArray new];
            self.upcoming = [NSMutableArray new];
            self.archive = [NSMutableArray new];
            
            for (Entry* e in success) {
                [self.entries addObject:e];
                if (e && e.ContestStatus) {
                    switch (e.ContestStatus.intValue) {
                        case ContestStatusLive:
                            [self.live addObject:e];
                            break;
                            
                        case ContestStatusUpcoming:
                            [self.upcoming addObject:e];
                            break;
                            
                        case ContestStatusArchive:
                            [self.archive addObject:e];
                            break;
                            
                        default:
                            break;
                    }
                }
            }
            [self.control setCount:[NSNumber numberWithInt:(int)self.live.count] forSegmentAtIndex:0];
            [self.control setCount:[NSNumber numberWithInt:(int)self.upcoming.count] forSegmentAtIndex:1];
            [self.control setCount:[NSNumber numberWithInt:(int)self.archive.count] forSegmentAtIndex:2];
            
            if (self.control.selectedSegmentIndex == 0) {
                if (self.live.count > 0) {
                    noEntries.hidden = YES;
                }
                else {
                    noEntries.hidden = NO;
                    noEntries.text = @"You have no live entries";
                }
            }
            else if (self.control.selectedSegmentIndex == 1) {
                if (self.upcoming.count > 0) {
                    noEntries.hidden = YES;
                }
                else {
                    noEntries.hidden = NO;
                    noEntries.text = @"You have no upcoming entries";
                }
            }
            else if (self.control.selectedSegmentIndex == 2) {
                if (self.archive.count > 0) {
                    noEntries.hidden = YES;
                }
                else {
                    noEntries.hidden = NO;
                    noEntries.text = @"You have no archived entries";
                }
            }
            
            [self.tableView reloadData];
        }
    }];
}

#pragma mark - TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.control.selectedSegmentIndex == 0) {
        if (self.live.count > 0) {
            return self.live.count;
        }
    }
    else if (self.control.selectedSegmentIndex == 1) {
        if (self.upcoming.count > 0) {
            return self.upcoming.count;
        }
    }
    else if (self.control.selectedSegmentIndex == 2) {
        if (self.archive.count > 0) {
            return self.archive.count;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"EntryCell";
    
    EntryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (self.control.selectedSegmentIndex == 0) {
        if (self.live.count > 0) {
            cell.entry = self.live[indexPath.row];
        }
    }
    else if (self.control.selectedSegmentIndex == 1) {
        if (self.upcoming.count > 0) {
            cell.entry = self.upcoming[indexPath.row];
        }
    }
    else if (self.control.selectedSegmentIndex == 2) {
        if (self.archive.count > 0) {
            cell.entry = self.archive[indexPath.row];
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 75.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.control.selectedSegmentIndex == 0) {
        if (self.live.count > 0) {
            
        }
    }
    else if (self.control.selectedSegmentIndex == 1) {
        if (self.upcoming.count > 0) {
            
        }
    }
    else if (self.control.selectedSegmentIndex == 2) {
        if (self.archive.count > 0) {
            
        }
    }
}

#pragma mark - DZNSegmentedControl Methods

- (DZNSegmentedControl *)control {
    if (!_control) {
        _control = [[DZNSegmentedControl alloc] initWithItems:self.menuItems];
        _control.delegate = self;
        _control.bouncySelectionIndicator = YES;
        _control.height = 60.0f;
        _control.showsGroupingSeparators = NO;
        _control.showsCount = YES;
        _control.autoAdjustSelectionIndicatorWidth = YES;
        _control.selectionIndicatorHeight = 2.0;
        _control.adjustsFontSizeToFitWidth = YES;
        [_control setBackgroundColor:[UIColor clearColor]];
        [_control setTintColor:[UIColor CustomBlueColor]];
        [_control setHairlineColor:[UIColor clearColor]];
        [_control setFont:[UIFont CustomRegularFontSize:15.0]];
        [_control setAnimationDuration:0.125];
        [_control addTarget:self action:@selector(didChangeSegment:) forControlEvents:UIControlEventValueChanged];
    }
    return _control;
}

- (void)didChangeSegment:(DZNSegmentedControl *)control {
    if (self.control.selectedSegmentIndex == 0) {
        if (self.live.count > 0) {
            noEntries.hidden = YES;
        }
        else {
            noEntries.hidden = NO;
            noEntries.text = @"You have no live entries";
        }
    }
    else if (self.control.selectedSegmentIndex == 1) {
        if (self.upcoming.count > 0) {
            noEntries.hidden = YES;
        }
        else {
            noEntries.hidden = NO;
            noEntries.text = @"You have no upcoming entries";
        }
    }
    else if (self.control.selectedSegmentIndex == 2) {
        if (self.archive.count > 0) {
            noEntries.hidden = YES;
        }
        else {
            noEntries.hidden = NO;
            noEntries.text = @"You have no archived entries";
        }
    }
    [self.tableView reloadData];
}

#pragma mark - UIBarPositioningDelegate Methods

- (UIBarPosition)positionForBar:(id <UIBarPositioning>)view {
    return UIBarPositionBottom;
}

@end
