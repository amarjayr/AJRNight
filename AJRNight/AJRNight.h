//
//  AJRNight.h
//  AJRNight
//
//  Created by Amar Ramachandran on 8/16/15.
//  Copyright © 2015 amarjayr. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for AJRNight.
FOUNDATION_EXPORT double AJRNightVersionNumber;

//! Project version string for AJRNight.
FOUNDATION_EXPORT const unsigned char AJRNightVersionString[];

#import "UIView+AJRNight.h"

@protocol AJRNightDelegate <NSObject>

@optional
-(void)goodMorning;
-(void)goodNight;

@end


@protocol AJRNightCustomViewDelegate <NSObject>

@required
-(void)goodMorning;
-(void)goodNight;

@end


@interface AJRNight : NSObject

+ (instancetype)sharedClient;

@property (nonatomic, getter=isNight) BOOL nightMode;
@property (nonatomic, strong) NSMutableArray* viewControllers;

-(void)addViewController:(UIViewController<AJRNightDelegate> *)controller;

@end
