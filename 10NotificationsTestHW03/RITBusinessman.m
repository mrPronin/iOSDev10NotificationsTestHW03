//
//  RITBusinessman.m
//  10NotificationsTestHW01
//
//  Created by Pronin Alexander on 06.02.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITBusinessman.h"
#import "RITGovernment.h"

@implementation RITBusinessman

#pragma mark - Initialization

- (id)init
{
    self = [super init];
    if (self) {
        NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
        
        [nc addObserver:self
               selector:@selector(taxLevelChangedNotification:)
                   name:RITGovernmentTaxLevelDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(averagePriceChangedNotification:)
                   name:RITGovernmentAveragePriceDidChangeNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(RITBusinessmanDidEnterBackgroundNotification:)
                   name:UIApplicationDidEnterBackgroundNotification
                 object:nil];
        
        [nc addObserver:self
               selector:@selector(RITBusinessmanWillEnterForegroundNotification:)
                   name:UIApplicationWillEnterForegroundNotification
                 object:nil];
    }
    return self;
}

- (void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Notification

- (void) taxLevelChangedNotification: (NSNotification*) notification {
    
    CGFloat taxLevel = [notification.userInfo[RITGovernmentTaxLevelUserInfoKey] floatValue];
    
    CGFloat variationPercent = (self.taxLevel == 0) ? 0 : (taxLevel/self.taxLevel-1)*100;
    
    self.taxLevel = taxLevel;
    
    NSLog(@"%@: tax level changed on %6.2f", self.name, variationPercent);
    
}

- (void) averagePriceChangedNotification: (NSNotification*) notification {
    
    CGFloat averagePrice = [notification.userInfo[RITGovernmentAveragePriceUserInfoKey] floatValue];
    
    CGFloat variationPercent = (self.averagePrice == 0) ? 0 : (averagePrice/self.averagePrice-1)*100;
    
    self.averagePrice = averagePrice;
    
    NSLog(@"%@: Average price changed on %6.2f", self.name, variationPercent);
    
}

- (void) RITBusinessmanDidEnterBackgroundNotification: (NSNotification*) notification {
    
    NSLog(@"%@ goes to the lunch.", self.name);
    
}

- (void) RITBusinessmanWillEnterForegroundNotification: (NSNotification*) notification {
    
    NSLog(@"%@ come back to the office.", self.name);
    
}

@end
