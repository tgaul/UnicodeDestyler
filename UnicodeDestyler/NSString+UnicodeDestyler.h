//
//  NSString+UnicodeDestyler.h
//  UnicodeDestyler
//
//  Created by Troy Gaul on 7/6/18.
//  Copyright © 2018 Troy Gaul. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (UnicodeDestyler)

- (NSString *)ud_stringWithDestyledUnicode;

+ (void)ud_debugDestyledUnicode;

@end

NS_ASSUME_NONNULL_END
