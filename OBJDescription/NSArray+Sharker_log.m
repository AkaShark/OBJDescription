//
//  NSArray+Sharker_log.m
//  OBJDescription
//
//  Created by didi on 2019/1/18.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "NSArray+Sharker_log.h"
#import "NSObject+Sharker_description.h"
@implementation NSArray (Sharker_log)

#ifdef DEBUG

- (NSString *)description{
    return [self sharker_descriptionWithLevel:1];
}
- (NSString *)descriptionWithLocale:(id)locale{
    return [self sharker_descriptionWithLevel:1];
}
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    return [self sharker_descriptionWithLevel:(int) level];
}


/**
 格式化输出打印

 @param level 当前数组的层级 最少为1
 @return 返回格式化字符串
 */
- (NSString *)sharker_descriptionWithLevel:(int)level{
//    值距离边界的空格
    NSString *subSapce = [self sharker_getSapceWithLevel:level];
//    [] 距离边界的空格
    NSString *space = [self sharker_getSapceWithLevel:level-1];
    NSMutableString *retString = [[NSMutableString alloc] init];
//    添加 [
    [retString appendString:@"["];
//   添加 value
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            NSString *value = (NSString *)obj;
            NSString *subString = [NSString stringWithFormat:@"\n%@\"%@\",",subSapce,value];
            [retString appendString:subString];
        }else if ([obj isKindOfClass:[NSArray class]]){
            NSArray *arr = (NSArray *)obj;
            NSString *str = [arr sharker_descriptionWithLevel:level+1];// 递归
            str = [NSString stringWithFormat:@"\n%@%@,",subSapce,str];
            [retString appendString:str];
        }else if ([obj isKindOfClass:[NSDictionary class]]){
            NSDictionary *dic = (NSDictionary *)obj;
//            调用dic的打印方法
            NSString *str = [dic descriptionWithLocale:nil indent:level +1];
            str = [NSString stringWithFormat:@"\n%@%@,",subSapce,str];
            [retString appendString:str];
        }else{
            NSString *subString = [NSString stringWithFormat:@"\n%@%@",subSapce,obj];
            [retString appendString:subString];
        }
    }];
    if ([retString hasPrefix:@","]) {
        [retString deleteCharactersInRange:NSMakeRange(retString.length-1, 1)];
    }
//    添加]
    [retString appendString:[NSString stringWithFormat:@"\n%@]",space]];
    return retString;
}


/**
 根据层级返回前面的sapce

 @param level 层级
 @return 空格
 */
- (NSString *)sharker_getSapceWithLevel:(int)level{
    NSMutableString *muStr = [[NSMutableString alloc]init];
    for (int i = 0; i<level; i++) {
        [muStr appendString:@"\t"];
    }
    return muStr;
}

#endif
@end
