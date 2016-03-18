//
//  ViewController.m
//  Strike
//
//  Created by Eric Sze on 3/18/16.
//  Copyright © 2016 myApps. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.usernameTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    [self loginButtonSetup];

//    [self.signUpButton setAttributedTitle:[self underLineTextString:@"Don't have an account? Sign up."] forState:UIControlStateNormal];
}

- (void)loginButtonSetup {
    self.loginButton.layer.borderWidth = 1.0;
    self.loginButton.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.loginButton.layer.cornerRadius = 5.0;
    self.loginButton.enabled = NO;
    [self.loginButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (![self.usernameTextField.text isEqualToString:@""] && ![self.passwordTextField.text isEqualToString:@""]) {
        self.loginButton.enabled = YES;
        [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
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
    
}

@end
