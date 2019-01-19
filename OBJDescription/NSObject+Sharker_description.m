//
//  NSObject+Sharker_description.m
//  OBJDescription
//
//  Created by didi on 2019/1/18.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "NSObject+Sharker_description.h"
#import <objc/runtime.h>
#import "NSDictionary+Sharker_log.h"

@implementation NSObject (Sharker_description)

// 重写description 方法
- (NSString *)description
{
    NSDictionary *dic = [self sharker_ivars];
    return [dic sharker_descriptionisObjc];
}

// 获取成员变量
- (NSDictionary *)sharker_ivars{
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    unsigned int outCount = 0;
    Ivar * ivars = class_copyIvarList([self class], &outCount);
    for (unsigned int i = 0; i < outCount; i ++) {
        Ivar ivar = ivars[i];
        const char * name = ivar_getName(ivar);
        const char * type = ivar_getTypeEncoding(ivar);
        NSString *nameStr = [NSString stringWithCString:name encoding:NSUTF8StringEncoding];
        NSString *typeStr = [NSString stringWithCString:type encoding:NSUTF8StringEncoding];
        nameStr = [nameStr stringByReplacingOccurrencesOfString:@"_" withString:@""];
        typeStr = [typeStr stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        typeStr = [typeStr stringByReplacingOccurrencesOfString:@"\\" withString:@""];
        typeStr = [typeStr stringByReplacingOccurrencesOfString:@"@" withString:@""];
//        如果是NSObject崩溃了 加安全判断 isa 使用KVC崩溃
        if (![nameStr isEqualToString:@"isa"]) {
            [dic setObject:[self valueForKey:nameStr] forKey:[NSString stringWithFormat:@"%@",nameStr]];
        }else{
            [dic setObject:@"Can't use in Object" forKey:@"import"];
        }
        
    }
    free(ivars);
    return [dic copy];
}

@end
