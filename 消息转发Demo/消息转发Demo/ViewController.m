//
//  ViewController.m
//  消息转发Demo
//
//  Created by xiongxianhui on 2019/4/16.
//  Copyright © 2019 xianhui. All rights reserved.
//

#import "ViewController.h"
#import "Teacher.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    Teacher *jack = [Teacher new];
    [jack eat:@"苹果"];
}


@end
