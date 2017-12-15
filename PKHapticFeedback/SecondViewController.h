//
//  SecondViewController.h
//  PKHapticFeedback
//
//  Created by Pranav Kasetti on 11/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)heavyHapticButtonPressed:(id)sender;
- (IBAction)mediumHapticButtonPressed:(id)sender;
- (IBAction)lightHapticButtonPressed:(id)sender;

- (IBAction)warningHapticButtonPressed:(id)sender;
- (IBAction)errorHapticButtonPressed:(id)sender;
- (IBAction)successHapticButtonPressed:(id)sender;

- (IBAction)selectionHapticButtonPressed:(id)sender;

- (IBAction)performanceTest:(id)sender;

@end
