//
//  main.m
//  UnicodeDestyler
//
//  Created by Troy Gaul on 7/6/18.
//  Copyright © 2018 Troy Gaul. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "NSString+UnicodeDestyler.h"

//void check(void);
//
//void test() {
//	check();
//
//	NSLog(@"%@", [@"𝔹ℍ test" ud_stringWithDestyledUnicode]);
//	NSLog(@"%@", [@"Wᴀʀʀᴇɴ Eʟʟɪs " ud_stringWithDestyledUnicode]);
//}

int main(int argc, const char * argv[]) {
	@autoreleasepool {
		NSArray<NSString*>* args = [NSProcessInfo processInfo].arguments;
		NSString* result = [args.lastObject ud_stringWithDestyledUnicode];
		
		[result writeToFile:@"/dev/stdout" atomically: NO encoding: NSUTF8StringEncoding error: nil];
		
//	    test();
	}
	
	return 0;
}
