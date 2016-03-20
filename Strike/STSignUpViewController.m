//
//  STSignUpViewController.m
//  Strike
//
//  Created by Eric Sze on 3/20/16.
//  Copyright © 2016 myApps. All rights reserved.
//

#import "STSignUpViewController.h"

@interface STSignUpViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (strong, nonatomic) UIView *indentView;

@end

@implementation STSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self phoneNumberTextFieldSetup];
}

- (void)phoneNumberTextFieldSetup {
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Phone Number" attributes: @{ NSForegroundColorAttributeName : [UIColor colorWithWhite:0.8 alpha:1.0] }];
    self.phoneNumberTextField.attributedPlaceholder = str;
    
    self.indentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.phoneNumberTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.phoneNumberTextField setLeftView:self.indentView];

}

- (IBAction)signInButtonTapped:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
