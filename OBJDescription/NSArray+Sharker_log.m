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

+ (void)load
{
    [self sharker_exchangeSelector:@selector(descriptionWithLocale:) andNewSelector:@selector(sharker_exchangeSelector:andNewSelector:)];
}

- (NSString *)sharker_descriptionWithLocale:(id)locale
{
    NSString *desc = [self sharker_descriptionWithLocale:locale];
    desc = [self replaceUnicode:desc];
    return desc;
}

- (NSString *)replaceUnicode:(NSString *)unicodeStr {
    NSString *tempStr1 = [unicodeStr stringByReplacingOccurrencesOfString:@"\\u" withString:@"\\U"];
    NSString *tempStr2 = [tempStr1 stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
    NSString *tempStr3 = [[@"\"" stringByAppendingString:tempStr2] stringByAppendingString:@"\""];
    NSData *tempData = [tempStr3 dataUsingEncoding:NSUTF8StringEncoding];
    NSString* returnStr = [NSPropertyListSerialization propertyListFromData:tempData
                                                           mutabilityOption:NSPropertyListImmutable
                                                                     format:NULL
                                                           errorDescription:NULL];
    return [returnStr stringByReplacingOccurrencesOfString:@"\\r\\n" withString:@"\n"];
}


@end
