//
//  SecondViewController.m
//  PKHapticFeedback
//
//  Created by Pranav Kasetti on 11/07/2017.
//  Copyright © 2017 Pranav Kasetti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"
#import "PKHapticFeedback-Swift.h"

@interface SecondViewController ()

@property (nonatomic) NSUInteger count;
@property (nonatomic) NSUInteger counter;
@property (nonatomic) Haptic *haptic;

@end

@implementation SecondViewController

-(IBAction) heavyHapticButtonPressed:(id)sender {
  [self.haptic generateFeedbackWithType:CompatibleHapticTypeHeavy];
}

- (IBAction)mediumHapticButtonPressed:(id)sender {
  [self.haptic generateFeedbackWithType:CompatibleHapticTypeMedium];
}

- (IBAction)lightHapticButtonPressed:(id)sender {
  [self.haptic generateFeedbackWithType:CompatibleHapticTypeLight];
}

- (IBAction)warningHapticButtonPressed:(id)sender {
  [self.haptic generateFeedbackWithType:CompatibleHapticTypeWarning];
}

- (IBAction)errorHapticButtonPressed:(id)sender {
  [self.haptic generateFeedbackWithType:CompatibleHapticTypeError];
}

- (IBAction)successHapticButtonPressed:(id)sender {
  [self.haptic generateFeedbackWithType:CompatibleHapticTypeSuccess];
}

- (IBAction)selectionHapticButtonPressed:(id)sender {
  [self.haptic generateFeedbackWithType:CompatibleHapticTypeSelection];
}

- (IBAction)performanceTest:(id)sender {
  self.count = 0;
  NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 repeats:YES block:^(NSTimer *timer) {
    [self generateNextFeedback];
    self.count = self.count + 1;
    if (self.count  == 200) {
      self.count = 0;
      [timer invalidate];
    }
  }];

  NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
  [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void) generateNextFeedback {
  [self.haptic generateFeedbackWithType:self.counter];
    if (self.counter != 6) {
      self.counter = self.counter + 1;
    } else {
      self.counter = 0;
    }
}

- (void) viewDidLoad {
  [super viewDidLoad];
  self.haptic = [[Haptic alloc] init];
}


@end
