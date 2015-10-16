//
//  MoreController.m
//  
//
//  Created by Mark Evans on 10/16/15.
//
//

#import "MoreController.h"

@interface MoreController ()

@end

@implementation MoreController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"More";
        self.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"More" image:[UIImage TabFour] tag:4];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTitle:@"More"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
