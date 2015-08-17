//
//  AJRNight.m
//  AJRNight
//
//  Created by Amar Ramachandran on 8/16/15.
//  Copyright © 2015 amarjayr. All rights reserved.
//

#import "AJRNight.h"
#import "UIView+AJRNight.h"

@implementation AJRNight

+ (instancetype)sharedClient {
    static AJRNight *sharedClient = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedClient = [[AJRNight alloc] init];
    });
    
    return sharedClient;
}

-(void)addViewController:(UIViewController<AJRNightDelegate> *)controller {
    if ([self.viewControllers containsObject:controller])
        return;
    
    [self.viewControllers addObject:controller];
    
    if (self.nightMode) {
        [controller.view goodNight];
        
        if ([controller respondsToSelector:@selector(goodNight)]) {
            [controller goodNight];
        }
    }
}

- (id)init {
    self = [super init];
    
    if (self) {
        self.nightMode = false;
        self.viewControllers = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)setNightMode:(BOOL)nightMode {
    if (nightMode == _nightMode)
        return;
    
    _nightMode = nightMode;
    
    if (nightMode) {
        [self goodNight];
    } else {
        [self goodMorning];
    }
}

- (void)goodMorning {
    for (UIViewController<AJRNightDelegate>* viewController in self.viewControllers) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        [viewController.view goodMorning];
        
        if ([viewController respondsToSelector:@selector(goodMorning)]) {
            [viewController goodMorning];
        }
        
        [UIView commitAnimations];
    }
    
    self.nightMode = false;
}

- (void)goodNight {
    for (UIViewController<AJRNightDelegate>* viewController in self.viewControllers) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.3];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        
        [viewController.view goodNight];
        
        if ([viewController respondsToSelector:@selector(goodNight)]) {
            [viewController goodNight];
        }
        
        [UIView commitAnimations];
    }
    
    self.nightMode = true;
}


@end
