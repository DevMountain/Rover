//
//  DMNRoverCollectionViewCell.m
//  Rover
//
//  Created by Andrew Madsen on 2/14/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import "DMNRoverCollectionViewCell.h"
#import "DMNMarsRover.h"

@implementation DMNRoverCollectionViewCell

- (void)prepareForReuse
{
	[super prepareForReuse];
	self.rover = nil;
	self.imageView.image = nil;
}

- (void)updateViews
{
	self.nameLabel.text = self.rover.name;
}

- (void)setRover:(DMNMarsRover *)rover
{
	if (rover != _rover) {
		_rover = rover;
		[self updateViews];
	}
}

@end
