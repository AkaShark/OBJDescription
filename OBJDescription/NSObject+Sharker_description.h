//
//  NSObject+Sharker_description.h
//  OBJDescription
//
//  Created by didi on 2019/1/18.
//  Copyright © 2019 Sharker. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Sharker_description)
- (void)sharker_exchangeSelector: (SEL)oldSel andNewSelector:(SEL)newSel;
@end

NS_ASSUME_NONNULL_END
