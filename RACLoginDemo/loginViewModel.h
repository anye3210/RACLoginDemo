//
//  loginViewModel.h
//  RACLoginDemo
//
//  Created by wpsd on 2016/11/23.
//  Copyright © 2016年 wpsd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ReactiveCocoa/ReactiveCocoa.h"

@interface loginViewModel : NSObject

@property (copy, nonatomic) NSString * name;
@property (copy, nonatomic) NSString * password;
@property (strong, nonatomic) RACSubject *successSubject;
@property (strong, nonatomic) RACSubject *failureSubject;
@property (strong, nonatomic) RACSubject *errorSubject;


- (id)isLoginAvailable;

- (void)login;

@end
