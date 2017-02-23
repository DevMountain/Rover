//
//  DMNPhotosCollectionViewController.m
//  Rover
//
//  Created by Andrew Madsen on 2/23/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

#import "DMNPhotosCollectionViewController.h"
#import "DMNSolDescription.h"
#import "DMNMarsRoverClient.h"
#import "DMNMarsPhoto.h"
#import "DMNPhotoCollectionViewCell.h"

@interface DMNPhotosCollectionViewController ()

@property (nonatomic, copy) NSArray *photoReferences;

@end

@implementation DMNPhotosCollectionViewController

static NSString * const reuseIdentifier = @"PhotoCell";

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[self fetchPhotoReferences];
}

#pragma mark - Private

- (void)fetchPhotoReferences
{
	if (!self.rover || !self.sol) {
		return;
	}
	
	DMNMarsRoverClient *client = [[DMNMarsRoverClient alloc] init];
	[client fetchPhotosFromRover:self.rover onSol:self.sol.sol completion:^(NSArray *photos, NSError *error) {
		if (error) {
			NSLog(@"Error getting photo references for %@ on %@: %@", self.rover, self.sol, error);
			return;
		}
		
		self.photoReferences = photos;
	}];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return self.photoReferences.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DMNPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
	
	UIImage *image = [UIImage imageNamed:@"MarsPlaceholder"];
	cell.imageView.image = image;
	
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark - Properties

- (void)setRover:(DMNMarsRover *)rover
{
	if (rover != _rover) {
		_rover = rover;
		[self fetchPhotoReferences];
	}
}

- (void)setSol:(DMNSolDescription *)sol
{
	if (sol != _sol) {
		_sol = sol;
		[self fetchPhotoReferences];
	}
}

- (void)setPhotoReferences:(NSArray *)photoReferences
{
	if (photoReferences != _photoReferences) {
		_photoReferences = [photoReferences copy];
		[self.collectionView reloadData];
	}
}

@end
