//
//  PreferencesViewController.m
//  AJRNight
//
//  Created by Amar Ramachandran on 8/16/15.
//  Copyright © 2015 amarjayr. All rights reserved.
//

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#import "PreferencesViewController.h"

@implementation PreferencesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{};
    
    [[UILabel appearance] setNightProperties:@{
                                               @"textColor": [UIColor whiteColor]
                                               }];
    
    self.view.nightProperties = @{
                                  @"backgroundColor": UIColorFromRGB(0x343338)
                                  };
    
    self.navigationController.navigationBar.nightProperties = @{
                                                                @"barTintColor": UIColorFromRGB(0x2F2D34),
                                                                @"titleTextAttributes": @{NSForegroundColorAttributeName: [UIColor whiteColor]}
                                                                };
    
    self.tabBarController.tabBar.nightProperties = @{
                                                     @"barTintColor": UIColorFromRGB(0x2F2D34)
                                                     };
    
    
    [[AJRNight sharedClient] addViewController:self];
}

- (void)goodNight {
    [self.navigationController.navigationBar goodNight];
    [self.tabBarController.tabBar goodNight];
}

- (void)goodMorning {
    [self.navigationController.navigationBar goodMorning];
    [self.tabBarController.tabBar goodMorning];
}

- (IBAction)changeNightModeSwitch:(id)sender {
    
    [[AJRNight sharedClient] setNightMode:![[AJRNight sharedClient] isNight]];
    
}

@end
