//
//  loginViewModel.m
//  RACLoginDemo
//
//  Created by wpsd on 2016/11/23.
//  Copyright © 2016年 wpsd. All rights reserved.
//

#import "loginViewModel.h"

@interface loginViewModel ()

@property (strong, nonatomic) RACSignal *nameSignal;
@property (strong, nonatomic) RACSignal *passwordSignal;

@end

@implementation loginViewModel

- (instancetype)init {
    if (self = [super init]) {
        
        self.nameSignal = RACObserve(self, name);
        self.passwordSignal = RACObserve(self, password);
        self.successSubject = [RACSubject subject];
        self.failureSubject = [RACSubject subject];
        self.errorSubject = [RACSubject subject];
        
    }
    return self;
}

- (id)isLoginAvailable {
    RACSignal *isValid = [RACSignal combineLatest:@[self.nameSignal, self.passwordSignal] reduce:^id(NSString *name, NSString *password){
        return @(name.length > 3 && password.length > 3);
    }];
    return isValid;
}

- (void)login {
    
    NSArray *requestData = @[self.name, self.password];
    [self.successSubject sendNext:requestData];
}

@end
