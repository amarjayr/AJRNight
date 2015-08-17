//
//  UIView+AJRNight.h
//  AJRNight
//
//  Created by Amar Ramachandran on 8/16/15.
//  Copyright © 2015 amarjayr. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (AJRNight)

@property (strong, nonatomic) NSDictionary* dayProperties;
@property (strong, nonatomic) NSDictionary* nightProperties;

@property (assign) BOOL isNight;

- (void)goodMorning;
- (void)goodNight;

- (void)nightAddSubview:(UIView *)view;

@end
