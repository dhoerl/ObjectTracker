//
//  ViewController.m
//  ObjectTracker
//
//  Created by David Hoerl on 5/13/13.
//  Copyright (c) 2013 dhoerl. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
	NSMutableSet *stuff;

	NSUInteger iteration;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	stuff = [NSMutableSet setWithCapacity:10];
}

- (IBAction)createAction:(id)sender
{
	NSArray *msgs = @[@"hi", @"bye", [NSNumber numberWithInteger:iteration]];
	[Tracker trackerWithObject:msgs msg:[NSString stringWithFormat:@"Messages array %d", iteration]];
	[stuff addObject:msgs];
	
	NSDictionary *dict = @{ @"color" : [UIColor redColor], @"size" : [NSNumber numberWithInteger:iteration] };
	[Tracker trackerWithObject:dict msg:[NSString stringWithFormat:@"Object dictionary %d", iteration]];
	[stuff addObject:dict];
	
	++iteration;
}

- (IBAction)logAction:(id)sender
{
	NSSet *set = [Tracker allTrackers];
	[Tracker printSet:set];
}

- (IBAction)freeOnMainAction:(id)sender
{
	[stuff removeAllObjects];
}

- (IBAction)freeOtherThread:(id)sender
{
	dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^
		{
			[stuff removeAllObjects];
		});
}

@end
