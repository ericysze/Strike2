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

@property (weak, nonatomic) IBOutlet UIView *unlockLockButtonViewContainer;

@property (weak, nonatomic) IBOutlet UIButton *unlockLockButton;

@end

@implementation STUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUnlockLockButtonViewContainer];
    [self setupButton];
}

- (void)setupUnlockLockButtonViewContainer {
    self.unlockLockButtonViewContainer.layer.cornerRadius = 75;
}

- (void)setupButton {
    self.unlockLockButton.layer.cornerRadius = 75;
    self.unlockLockButton.layer.borderWidth = 3;
    self.unlockLockButton.layer.borderColor = [UIColor whiteColor].CGColor;
}

- (IBAction)unlockLockButtonTapped:(UIButton *)sender {
    self.lockedUnlockedLabel.text = @"UNLOCKED";
    self.holdToUnlockLockLabel.text = @"RELEASE TO LOCK";
    
    UILongPressGestureRecognizer *longPressEnded = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressEnded:)];
    [self.unlockLockButton addGestureRecognizer:longPressEnded];
}

- (void)longPressEnded:(UILongPressGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Long Press");
        self.lockedUnlockedLabel.text = @"LOCKED";
        self.holdToUnlockLockLabel.text = @"HOLD TO UNLOCK";
    }
}


@end
