//
//  BaseController.m
//  
//
//  Created by Mark Evans on 10/16/15.
//
//

#import "BaseController.h"

@interface BaseController ()

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor CustomGrayBackgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Custom Methods

- (void)setupLogo {
    if (self.navigationController) {
        UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage CustomNavLogo]];
        [self.navigationItem setTitleView:titleView];
    }
}

- (void)setupTitle:(NSString*)title {
    if (self.navigationController) {
        self.title = title.uppercaseString;
    }
    if (self.tabBarItem) {
        self.tabBarItem.title = title.capitalizedString;
    }
}

@end
