//
//  UIView+AJRNight.m
//  AJRNight
//
//  Created by Amar Ramachandran on 8/16/15.
//  Copyright © 2015 amarjayr. All rights reserved.
//

#import "UIView+AJRNight.h"
#import <objc/runtime.h>

@implementation UIView (AJRNight)

- (BOOL) isNight {
    NSNumber *number = objc_getAssociatedObject(self, @selector(isNight));
    return [number boolValue];
}

- (void)setIsNight: (BOOL) isNight {
    NSNumber *number = [NSNumber numberWithBool: isNight];
    objc_setAssociatedObject(self, @selector(isNight), number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*) dayProperties {
    return objc_getAssociatedObject(self, @selector(dayProperties));
}

- (void)setDayProperties: (UIColor *) dayProperties {
    objc_setAssociatedObject(self, @selector(dayProperties), dayProperties, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString*) nightProperties {
    return objc_getAssociatedObject(self, @selector(nightProperties));
}

- (void)setNightProperties: (UIColor *) nightProperties {
    objc_setAssociatedObject(self, @selector(nightProperties), nightProperties, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)goodNight {

    for(id key in self.nightProperties) {
        if (![self.dayProperties objectForKey:key]) {
            NSMutableDictionary* tempDayProperties = [[NSMutableDictionary alloc] initWithDictionary:self.dayProperties];
            
            if ([self valueForKey:key])
                [tempDayProperties setObject:[self valueForKey:key] forKey:key];
            else
                NSAssert(NO, @"%@ (%@) does not have a value for %@. To fix this, explicitly set %@ in your viewDidLoad", self, [self class], key, key);
            
            
            self.dayProperties = [[NSDictionary alloc] initWithDictionary:tempDayProperties];
        }
        
        [self setValue:[self.nightProperties objectForKey:key] forKey:key];
        
    }
    
    for (UIView *view in self.subviews)
    {
        [view goodNight];
    }
    
    self.isNight = true;
    
}

- (void)goodMorning {
    if (!self.isNight)
        return;
    
    for(id key in self.dayProperties) {
        [self setValue:[self.dayProperties objectForKey:key] forKey:key];
    }
    
    for (UIView *view in self.subviews)
    {
        [view goodMorning];
    }
    
    self.isNight = false;
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(addSubview:);
        SEL swizzledSelector = @selector(nightAddSubview:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}


- (void)nightAddSubview:(nonnull UIView *)view {
    [self nightAddSubview:view];
    
    if ([self isNight])
        [view goodNight];
}

@end
