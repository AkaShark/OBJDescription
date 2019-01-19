//
//  NSDictionary+Sharker_log.m
//  OBJDescription
//
//  Created by didi on 2019/1/18.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import "NSDictionary+Sharker_log.h"

@implementation NSDictionary (Sharker_log)

#ifdef DEBUG

- (NSString *)sharker_descriptionisObjc{
    return [self sharker_descriptionWithLevel:2];
}
- (NSString *)description
{
    return [self sharker_descriptionWithLevel:1];
}
- (NSString *)descriptionWithLocale:(id)locale{
    return [self sharker_descriptionWithLevel:1];
}
- (NSString *)descriptionWithLocale:(id)locale indent:(NSUInteger)level{
    return [self sharker_descriptionWithLevel:(int)level];
}



/**
 格式化输出字典

 @param level 层级
 @return 格式化字符串
 */
- (NSString *)sharker_descriptionWithLevel:(int)level{
    NSString *subSpace = [self sharker_getSpaceWithLevel:level];
    NSString *space = [self sharker_getSpaceWithLevel:level-1];
    NSMutableString *retString = [[NSMutableString alloc] init];
    //    添加 {
    [retString appendString:@"{"];
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            NSString *value = (NSString *)obj;
            value = [value stringByReplacingOccurrencesOfString:@"\0" withString:@"\\0"];
            NSString *subString = [NSString stringWithFormat:@"\n%@\"%@\" : \"%@\",",subSpace,key,value];
            [retString appendString:subString];
        }else if ([obj isKindOfClass:[NSDictionary class]]){
            NSDictionary *dic = (NSDictionary *)obj;
            NSString *str = [dic sharker_descriptionWithLevel:level+1];
            str = [NSString stringWithFormat:@"\n%@\"%@\" : %@,", subSpace, key, str];
            [retString appendString:str];
        }else if ([obj isKindOfClass:[NSArray class]]){
            NSArray *arr = (NSArray *)obj;
            NSString *str = [arr descriptionWithLocale:nil indent:level+1];
            str = [NSString stringWithFormat:@"\n%@\"%@\" : %@,", subSpace, key, str];
            [retString appendString:str];
        }else{
//            字典的属性是其他类型 可以空充需要的打印方式
            NSString *str = [NSString stringWithFormat:@"\n%@\"%@\" : %@,", subSpace, key, obj];
            [retString appendString:str];
        }
    }];
    if ([retString hasSuffix:@","]) {
        [retString deleteCharactersInRange:NSMakeRange(retString.length-1, 1)];
    }
    //    添加 }
    [retString appendString:[NSString stringWithFormat:@"\n%@}",space]];
    return retString;
}

/**
 根据层级，返回前面的空格占位符
 
 @param level 层级
 @return 占位空格
 */
- (NSString *)sharker_getSpaceWithLevel:(int)level {
    NSMutableString *mustr = [[NSMutableString alloc] init];
    for (int i=0; i<level; i++) {
        [mustr appendString:@"\t"];
    }
    return mustr;
}

#endif
@end
