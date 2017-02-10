//
//  AppDelegate.m
//  Rover
//
//  Created by Andrew Madsen on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import "DMNRoverAppDelegate.h"
#import "DMNMarsRoverClient.h"
#import "DMNMarsRover.h"
#import "DMNMarsPhoto.h"

@interface DMNRoverAppDelegate ()

@end

@implementation DMNRoverAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
	DMNMarsRoverClient *client = [[DMNMarsRoverClient alloc] init];
	[client fetchMarsRoverNamed:@"curiosity" completion:^(DMNMarsRover *rover, NSError *error) {
		NSLog(@"Rover: %@", rover);
		[client fetchPhotosFromRover:rover onSol:0 completion:^(NSArray *photos, NSError *error) {
			NSLog(@"photos: %@", photos);
		}];
	}];
	return YES;
}

@end
