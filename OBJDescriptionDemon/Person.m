//
//  Person.m
//  OBJDescription
//
//  Created by didi on 2019/1/18.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "Person.h"

@implementation Person
- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"鲨鱼男孩";
        _age = 10;
        _info = @{@"家庭住址":@"北京市",@"电话":@"1888888"};
    }
    return self;
}

@end
