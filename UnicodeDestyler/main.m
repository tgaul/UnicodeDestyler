//
//  main.m
//  UnicodeDestyler
//
//  Created by Troy Gaul on 7/6/18.
//  Copyright © 2018 Troy Gaul. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+UnicodeDestyler.h"

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSArray<NSString*>* args = [NSProcessInfo processInfo].arguments;
		NSString* result = [args.lastObject ud_stringWithDestyledUnicode];
		
		[result writeToFile:@"/dev/stdout" atomically: NO encoding: NSUTF8StringEncoding error: nil];
	}
	
	return 0;
}
