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

@property (strong, nonatomic) UIView *indentView;

@property (nonatomic, assign) id currentResponder;

@end

@implementation STSignUpViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self phoneNumberTextFieldSetup];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [self.view addGestureRecognizer:singleTap];
    
}

- (void)phoneNumberTextFieldSetup {
    self.phoneNumberTextField.delegate = self;
    
    NSAttributedString *str = [[NSAttributedString alloc] initWithString:@"Phone Number" attributes: @{ NSForegroundColorAttributeName : [UIColor colorWithWhite:0.8 alpha:1.0] }];
    self.phoneNumberTextField.attributedPlaceholder = str;
    
    self.indentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.phoneNumberTextField setLeftViewMode:UITextFieldViewModeAlways];
    [self.phoneNumberTextField setLeftView:self.indentView];

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
