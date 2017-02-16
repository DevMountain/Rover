//
//  DMNRoverCollectionViewCell.h
//  Rover
//
//  Created by Andrew Madsen on 2/14/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DMNMarsRover;

@interface DMNRoverCollectionViewCell : UICollectionViewCell

// Properties

@property (nonatomic, strong) DMNMarsRover *rover;

// Outlets
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, strong) IBOutlet UILabel *nameLabel;

@end
