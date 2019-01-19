//
//  ViewController.m
//  OBJDescription
//
//  Created by didi on 2019/1/18.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Dog.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *arr = @[[Dog new]];
    NSDictionary *dic = @{@"dog":[Dog new]};
    NSLog(@"%@\n\n%@",arr,dic);
}


@end
