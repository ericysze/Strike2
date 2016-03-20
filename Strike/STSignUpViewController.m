//
//  STSignUpViewController.m
//  Strike
//
//  Created by Eric Sze on 3/20/16.
//  Copyright © 2016 myApps. All rights reserved.
//

#import "STSignUpViewController.h"

@interface STSignUpViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;

@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (weak, nonatomic) IBOutlet UIButton *signInButton;

@property (strong, nonatomic) UIView *indentView;

@property (nonatomic, assign) id currentResponder;

@end

@implementation STSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self phoneNumberTextFieldSetup];
    [self nextButtonSetup];
    [self tapGestureToDismissKeyboard];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    CALayer *topBorder = [CALayer layer];
    topBorder.frame = CGRectMake(0.0f, 0.0f, self.signInButton.frame.size.width, 0.3f);
    topBorder.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5].CGColor;
    [self.signInButton.layer addSublayer:topBorder];
}

- (void)phoneNumberTextFieldSetup {
    self.phoneNumberTextField.delegate = self;
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Phone Number" attributes: @{ NSForegroundColorAttributeName : [UIColor colorWithWhite:1.0 alpha:0.8] }];
    self.phoneNumberTextField.attributedPlaceholder = str;
    
    self.indentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.phoneNumberTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.phoneNumberTextField setLeftView:self.indentView];

}

- (void)nextButtonSetup {
    self.nextButton.layer.borderWidth = 1.0;
    self.nextButton.layer.borderColor = [UIColor lightTextColor].CGColor;
    self.nextButton.layer.cornerRadius = 5.0;
    self.nextButton.enabled = NO;
    [self.nextButton setTitleColor:[UIColor lightTextColor] forState:UIControlStateNormal];
}

#pragma mark - Tap Gesture Dismiss Keyboard
- (void)tapGestureToDismissKeyboard {
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [self.view addGestureRecognizer:singleTap];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentResponder = textField;
}

    
- (void)resignOnTap:(id)sender {
    [self.currentResponder resignFirstResponder];
}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
//    [textField resignFirstResponder];
//    return YES;
//}

- (IBAction)signInButtonTapped:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
