//
//  ViewController.m
//  RACLoginDemo
//
//  Created by wpsd on 2016/11/23.
//  Copyright © 2016年 wpsd. All rights reserved.
//

#import "ViewController.h"
#import "ReactiveCocoa/ReactiveCocoa.h"
#import "loginViewModel.h"
#import "LoginSuccessViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (strong, nonatomic) loginViewModel *viewModel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self combineViewModel];
    
    [self onClick];
}

- (void)combineViewModel {
    
    loginViewModel *viewModel = [[loginViewModel alloc] init];
    self.viewModel = viewModel;
    RAC(self.viewModel, name) = self.nameTF.rac_textSignal;
    RAC(self.viewModel, password) = self.passwordTF.rac_textSignal;
    RAC(self.loginBtn, enabled) = [self.viewModel isLoginAvailable];
    [self.viewModel.successSubject subscribeNext:^(NSArray *x) {
        LoginSuccessViewController *sucVC = [[LoginSuccessViewController alloc] init];
        sucVC.name = x[0];
        sucVC.password = x[1];
        [self presentViewController:sucVC animated:YES completion:nil];
    }];
    
}

- (void)onClick {
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        
        [self.viewModel login];
        
    }];
}

@end
