//
//  RITAppDelegate.m
//  10NotificationsTestHW03
//
//  Created by Pronin Alexander on 07.02.14.
//  Copyright (c) 2014 Pronin Alexander. All rights reserved.
//

#import "RITAppDelegate.h"
#import "RITGovernment.h"
#import "RITDoctor.h"
#import "RITPensioner.h"
#import "RITBusinessman.h"

@interface RITAppDelegate ()
@property (strong, nonatomic) RITGovernment* government;
@property (strong, nonatomic) RITDoctor* doctor;
@property (strong, nonatomic) RITPensioner* pensioner;
@property (strong, nonatomic) RITBusinessman* businessman;

@end

@implementation RITAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    // create government object
    self.government  = [[RITGovernment alloc] init];
    
    // create human objects
    self.doctor    = [[RITDoctor alloc] init];
    self.pensioner = [[RITPensioner alloc] init];
    self.businessman = [[RITBusinessman alloc] init];
    
    // set initial values
    self.doctor.name       = @"Doctor01";
    self.pensioner.name    = @"Pensioner01";
    self.businessman.name    = @"Businessman";
    self.doctor.salary = self.government.salary;
    self.doctor.averagePrice = self.government.averagePrice;
    self.pensioner.pension = self.government.pension;
    self.pensioner.averagePrice = self.government.averagePrice;
    self.businessman.taxLevel = self.government.taxLevel;
    self.businessman.averagePrice = self.government.averagePrice;
    
    // change government options #01
    NSLog(@"Government options: 2011 year");
    self.government.taxLevel        = 5.5f;
    self.government.salary          = 1100;
    self.government.averagePrice    = 15;
    self.government.pension         = 550;
    NSLog(@"\n");
    
    // change government options #02
    NSLog(@"Government options: 2012 year");
    self.government.salary          = 1050;
    self.government.averagePrice    = 18;
    self.government.pension         = 555;
    self.government.taxLevel        = 5.8f;
    NSLog(@"\n");
    
    // change government options #03
    NSLog(@"Government options: 2013 year");
    self.government.salary          = 1150;
    self.government.taxLevel        = 6.3f;
    NSLog(@"\n");
    
    // change government options #04
    NSLog(@"Government options: 2014 year");
    self.government.salary          = 900;
    self.government.taxLevel        = 6.5f;
    NSLog(@"\n");
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
