//
//  ContestsController.m
//  
//
//  Created by Mark Evans on 10/16/15.
//
//

#import "ContestsController.h"

@interface ContestsController ()
@property (nonatomic, strong) NSMutableArray *contests;
@end

@implementation ContestsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Contests";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Contests" image:[UIImage TabTwo] tag:2];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self loadContests];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Custom Methods

- (void)setupView {
    [self setupTitle:@"Contests"];
}

- (void)loadContests {
    [[Services sharedInstance] getContests:^(NSArray *success) {
        if (success) {
            self.contests = [[NSMutableArray alloc] initWithArray:success];
            
            for (Contest *c in self.contests) {
                NSLog(@"contest: %@", c.Title);
            }
        }
    }];
}

@end
