//
//  DMNSolsTableViewController.m
//  Rover
//
//  Created by Andrew Madsen on 2/23/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import "DMNSolsTableViewController.h"
#import "DMNMarsRover.h"
#import "DMNSolDescription.h"

@interface DMNSolsTableViewController ()

@end

@implementation DMNSolsTableViewController

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.rover.solDescriptions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SolCell" forIndexPath:indexPath];
    
	DMNSolDescription *sol = self.rover.solDescriptions[indexPath.row];
	cell.textLabel.text = [NSString stringWithFormat:@"Sol %@", @(sol.sol)];
	cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ Photos", @(sol.numberOfPhotos)];
	
    return cell;
}


#pragma mark - Properties

- (void)setRover:(DMNMarsRover *)rover
{
	if (rover != _rover) {
		_rover = rover;
		[self.tableView reloadData];
	}
}

@end
