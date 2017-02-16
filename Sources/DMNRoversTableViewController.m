//
//  DMNRoversTableViewController.m
//  Rover
//
//  Created by Andrew Madsen on 2/16/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import "DMNRoversTableViewController.h"
#import "DMNMarsRover.h"
#import "DMNMarsRoverClient.h"

@interface DMNRoversTableViewController ()

@property (nonatomic, strong) NSArray *rovers;

@end

@implementation DMNRoversTableViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	DMNMarsRoverClient *client = [[DMNMarsRoverClient alloc] init];
	[client fetchMarsRoversWithCompletion:^(NSArray *rovers, NSError *error) {
		if (error) {
			NSLog(@"Error fetching info for mars rovers: %@", error);
			return;
		}
		
		self.rovers = rovers;
	}];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return self.rovers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RoverCell" forIndexPath:indexPath];
 
	cell.textLabel.text = [self.rovers[indexPath.row] name];
 
	return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	
}

#pragma mark - Properties

- (void)setRovers:(NSArray *)rovers
{
	if (rovers != _rovers) {
		_rovers = rovers;
		[self.tableView reloadData];
	}
}

@end
