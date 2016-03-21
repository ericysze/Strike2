//
//  STUserViewController.m
//  Strike
//
//  Created by Eric Sze on 3/20/16.
//  Copyright © 2016 myApps. All rights reserved.
//

#import "STUserViewController.h"

@interface STUserViewController ()

@property (weak, nonatomic) IBOutlet UILabel *lockedUnlockedLabel;

@property (weak, nonatomic) IBOutlet UILabel *holdToUnlockLockLabel;

@property (weak, nonatomic) IBOutlet UIButton *unlockLockButton;

@end

@implementation STUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)unlockLockButtonTapped:(UIButton *)sender {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.unlockLockButton addGestureRecognizer:longPress];
}

- (void)longPress:(UILongPressGestureRecognizer*)gesture {
    if (gesture.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Long Press");
    }
}


@end
