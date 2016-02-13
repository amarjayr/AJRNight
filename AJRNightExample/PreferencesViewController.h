//
//  PreferencesViewController.h
//  AJRNight
//
//  Created by Amar Ramachandran on 8/16/15.
//  Copyright © 2015 amarjayr. All rights reserved.
//

#import <UIKit/UIKit.h>

@import AJRNight;

@interface PreferencesViewController : UIViewController <AJRNightDelegate>

- (IBAction)changeNightModeSwitch:(id)sender;

@end
