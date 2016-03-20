//
//  ViewController.m
//  Strike
//
//  Created by Eric Sze on 3/18/16.
//  Copyright © 2016 myApps. All rights reserved.
//

#import "STSignInViewController.h"
#import "STSignUpViewController.h"

@interface STSignInViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@property (strong, nonatomic) UIView *indentView;

@end

@implementation STSignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self phoneNumberTextFieldSetup];
    [self passwordTextFieldSetup];
    [self loginButtonSetup];

//    [self.signUpButton setAttributedTitle:[self underLineTextString:@"Sign up."] forState:UIControlStateNormal];
}

- (void)phoneNumberTextFieldSetup {
    self.phoneNumberTextField.delegate = self;
    
    NSAttributedString *phoneNumberStr = [[NSAttributedString alloc] initWithString:@"Phone Number" attributes: @{ NSForegroundColorAttributeName : [UIColor colorWithWhite:1.0 alpha:0.8] }];
    self.phoneNumberTextField.attributedPlaceholder = phoneNumberStr;

    self.indentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.phoneNumberTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.phoneNumberTextField setLeftView:self.indentView];
}

- (void)passwordTextFieldSetup {
    self.passwordTextField.delegate = self;
    
    NSAttributedString *passwordStr = [[NSAttributedString alloc] initWithString:@"Password" attributes: @{ NSForegroundColorAttributeName : [UIColor colorWithWhite:1.0 alpha:0.8] }];
    self.passwordTextField.attributedPlaceholder = passwordStr;
    
    self.indentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.passwordTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.passwordTextField setLeftView:self.indentView];
}

- (void)loginButtonSetup {
    self.loginButton.layer.borderWidth = 1.0;
    self.loginButton.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.loginButton.layer.cornerRadius = 5.0;
    self.loginButton.enabled = NO;
    [self.loginButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (![self.phoneNumberTextField.text isEqualToString:@""] && ![self.passwordTextField.text isEqualToString:@""]) {
        self.loginButton.enabled = YES;
        [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    } else if (self.phoneNumberTextField.text.length < 1 && self.passwordTextField.text.length < 1) {
        self.loginButton.enabled = NO;
        [self.loginButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
    }
    return YES;
}


//- (NSMutableAttributedString *)underLineTextString:(NSString *)str
//{
//    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:str];
//    
//    [titleString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:15.0] range:NSMakeRange(0, [titleString length])];
//    
//    return titleString;
//}

- (IBAction)signUpButtonTapped:(UIButton *)sender {
    STSignUpViewController *signUpVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [[self navigationController] pushViewController:signUpVC animated:YES];
}

@end
