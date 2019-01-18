//
//  ViewController.m
//  OBJDescription
//
//  Created by didi on 2019/1/18.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+Sharker_description.h"
#import "NSArray+Sharker_log.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *person = [[Person alloc] init];
    NSArray *array = @[@"哈哈",@"111",@"adv"];
    NSLog(@"%@",array);
}


@end
