//
//  NSString+UnicodeDestyler.m
//  UnicodeDestyler
//
//  Created by Troy Gaul on 7/6/18.
//  Copyright © 2018 Troy Gaul. All rights reserved.
//

#import "NSString+UnicodeDestyler.h"

static const UTF32Char mathematicalBoldCapitalA = 0x1D400;
static const UTF32Char mathematicalBoldSmallA = 0x1D41A;
static const UTF32Char mathematicalBoldDigit0 = 0x1D7CE;

static const UTF32Char mathematicalItalicCapitalA = 0x1D434;
static const UTF32Char mathematicalItalicSmallA = 0x1D44E;

static const UTF32Char mathematicalBoldItalicCapitalA = 0x1D468;
static const UTF32Char mathematicalBoldItalicSmallA = 0x1D482;

static const UTF32Char mathematicalScriptCapitalA = 0x1D49C;
static const UTF32Char mathematicalScriptSmallA = 0x1D4B6;

static const UTF32Char mathematicalBoldScriptCapitalA = 0x1D4D0;
static const UTF32Char mathematicalBoldScriptSmallA = 0x1D4EA;

static const UTF32Char mathematicalFrakturCapitalA = 0x1D504;
static const UTF32Char mathematicalFrakturSmallA = 0x1D51E;

static const UTF32Char mathematicalDoubleStruckCapitalA = 0x1D538;
static const UTF32Char mathematicalDoubleStruckSmallA = 0x1D552;
static const UTF32Char mathematicalDoubleStruckDigit0 = 0x1D7D8;

static const UTF32Char mathematicalBoldFrakturCapitalA = 0x1D56C;
static const UTF32Char mathematicalBoldFrakturSmallA = 0x1D586;

static const UTF32Char mathematicalSanSerifCapitalA = 0x1D5A0;
static const UTF32Char mathematicalSanSerifSmallA = 0x1D5BA;
static const UTF32Char mathematicalSanSerifDigit0 = 0x1D7E2;

static const UTF32Char mathematicalSanSerifBoldCapitalA = 0x1D5D4;
static const UTF32Char mathematicalSanSerifBoldSmallA = 0x1D5EE;
static const UTF32Char mathematicalSanSerifBoldDigit0 = 0x1D7EC;

static const UTF32Char mathematicalSanSerifItalicCapitalA = 0x1D608;
static const UTF32Char mathematicalSanSerifItalicSmallA = 0x1D622;

static const UTF32Char mathematicalSanSerifBoldItalicCapitalA = 0x1D63C;
static const UTF32Char mathematicalSanSerifBoldItalicSmallA = 0x1D656;

static const UTF32Char mathematicalMonospaceCapitalA = 0x1D670;
static const UTF32Char mathematicalMonospaceSmallA = 0x1D68A;
static const UTF32Char mathematicalMonospaceDigit0 = 0x1D7F6;

static UTF32Char styledCapitalAs[] = {
	mathematicalBoldCapitalA,
	mathematicalItalicCapitalA,
	mathematicalBoldItalicCapitalA,
	mathematicalScriptCapitalA,
	mathematicalBoldScriptCapitalA,
	mathematicalFrakturCapitalA,
	mathematicalDoubleStruckCapitalA,
	mathematicalBoldFrakturCapitalA,
	mathematicalSanSerifCapitalA,
	mathematicalSanSerifBoldCapitalA,
	mathematicalSanSerifItalicCapitalA,
	mathematicalSanSerifBoldItalicCapitalA,
	mathematicalMonospaceCapitalA,
};

static UTF32Char styledSmallAs[] = {
	mathematicalBoldSmallA,
	mathematicalItalicSmallA,
	mathematicalBoldItalicSmallA,
	mathematicalScriptSmallA,
	mathematicalBoldScriptSmallA,
	mathematicalFrakturSmallA,
	mathematicalDoubleStruckSmallA,
	mathematicalBoldFrakturSmallA,
	mathematicalSanSerifSmallA,
	mathematicalSanSerifBoldSmallA,
	mathematicalSanSerifItalicSmallA,
	mathematicalSanSerifBoldItalicSmallA,
	mathematicalMonospaceSmallA,
};

static UTF32Char styled0s[] = {
	mathematicalBoldDigit0,
	mathematicalDoubleStruckDigit0,
	mathematicalSanSerifBoldDigit0,
	mathematicalSanSerifDigit0,
	mathematicalMonospaceDigit0,
};

static NSDictionary *individualMappings() {
	return @{
		@"\U00002102": @"C",
		
		@"\U0000210A": @"g",
		@"\U0000210B": @"H",
		@"\U0000210C": @"H",
		@"\U0000210D": @"H",
		@"\U0000210E": @"h",
		@"\U0000210F": @"h",
		@"\U00002110": @"I",
		@"\U00002111": @"I",
		@"\U00002112": @"L",
		@"\U00002113": @"l",
		
		@"\U00002115": @"N",
		
		@"\U00002119": @"P",
		@"\U0000211A": @"Q",
		@"\U0000211B": @"R",
		@"\U0000211C": @"R",
		@"\U0000211D": @"R",
		
		@"\U00002124": @"Z",
		
		@"\U0000212C": @"B",
		@"\U0000212D": @"C",
		@"\U0000212F": @"e",
		@"\U00002130": @"E",
		@"\U00002131": @"F",
		
		@"\U00002133": @"M",
		
		@"\U00002134": @"o",
		
		@"\U00002139": @"i",
		
		@"\U00002145": @"D",
		@"\U00002146": @"d",
		@"\U00002147": @"e",
		@"\U00002148": @"i",
		@"\U00002149": @"j",
		
		// small caps:
		
		@"\U00001D00": @"a",
		@"\U00000299": @"b",
		@"\U00001D04": @"c",
		@"\U00001D05": @"d",
		@"\U00001D07": @"e",
		@"\U0000A730": @"f",
		@"\U00000262": @"g",
		@"\U0000029C": @"h",
		@"\U0000026A": @"i",
		@"\U00001D0A": @"j",
		@"\U00001D0B": @"k",
		@"\U0000029F": @"l",
		@"\U00001D0D": @"m",
		@"\U00000274": @"n",
		@"\U00001D0F": @"o",
		@"\U00001D18": @"p",
//		@"\U00001D00": @"q",	// no Q in Unicode
		@"\U00000280": @"r",
		@"\U0000A731": @"s",
		@"\U00001D1B": @"t",
		@"\U00001D1C": @"u",
		@"\U00001D20": @"v",
		@"\U00001D21": @"w",
//		@"\U00001D00": @"x",	// no X in Unicode
		@"\U0000028F": @"y",
		@"\U00001D22": @"z",
	};
}

static NSString *strForUTF32Char(UTF32Char ch) {
	UTF32Char littleChar = NSSwapHostIntToLittle(ch);
	return [[NSString alloc] initWithBytes:&littleChar length:4
								  encoding:NSUTF32LittleEndianStringEncoding];
}

static void add(NSMutableDictionary *dict, UTF32Char srcUTF32Char, unichar dstUnichar) {
	NSString *src = strForUTF32Char(srcUTF32Char);
	NSString *dst = [NSString stringWithCharacters:&dstUnichar length:1];
	dict[src] = dst;
}

static NSDictionary *allMappings() {
	static NSDictionary *all = nil;
	static dispatch_once_t onceToken;
	
	dispatch_once(&onceToken, ^{
		NSMutableDictionary *dict = [NSMutableDictionary dictionary];
		
		for (NSInteger i = 0 ; i < sizeof(styledCapitalAs) / sizeof(styledCapitalAs[0]) ; ++i) {
			UTF32Char a = styledCapitalAs[i];
			
			for (int j = 0 ; j < 26 ; ++j) {
				add(dict, a + j, 'A' + j);
			}
		}
		
		for (NSInteger i = 0 ; i < sizeof(styledSmallAs) / sizeof(styledSmallAs[0]) ; ++i) {
			UTF32Char a = styledSmallAs[i];
			
			for (int j = 0 ; j < 26 ; ++j) {
				add(dict, a + j, 'a' + j);
			}
		}
		
		for (NSInteger i = 0 ; i < sizeof(styled0s) / sizeof(styled0s[0]) ; ++i) {
			UTF32Char zero = styled0s[i];
			
			for (int j = 0 ; j < 10 ; ++j) {
				add(dict, zero + j, '0' + j);
			}
		}
		
		NSDictionary *mappings = individualMappings();
		[mappings enumerateKeysAndObjectsUsingBlock:^(NSString *src, NSString *dst, BOOL *stop) {
			dict[src] = dst;
		}];
		
		all = [NSDictionary dictionaryWithDictionary:dict];
	});
	
	return all;
}

NSCharacterSet *asciiUnicodeMathCharacterSet() {
	static NSMutableCharacterSet *set = nil;
	static dispatch_once_t onceToken;
	
	dispatch_once(&onceToken, ^{
		set = [NSMutableCharacterSet new];
		
		for (NSString *key in allMappings().keyEnumerator) {
			[set addCharactersInString:key];
		}
	});
	
	return set;
}

void check() {
	NSDictionary *mappings = allMappings();
	
	NSMutableDictionary *reversed = [NSMutableDictionary dictionary];
	[mappings enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSString *obj, BOOL *stop) {
		NSString *existing = reversed[obj];
		if (existing) {
			reversed[obj] = [existing stringByAppendingString:key];
		}
		else {
			reversed[obj] = key;
		}
	}];
	
	NSArray *keys = [reversed.allKeys sortedArrayUsingSelector:@selector(compare:)];
	for (NSString *key in keys) {
		NSLog(@"%@ <- %@", key, reversed[key]);
	}
}


@implementation NSString (UnicodeDestyler)

- (NSString *)ud_stringWithDestyledUnicode
{
	if ([self rangeOfCharacterFromSet: asciiUnicodeMathCharacterSet()].location == NSNotFound) {
		return self;
	}
	
	NSMutableString *outStr = [self mutableCopy];
	
	[allMappings() enumerateKeysAndObjectsUsingBlock:^(NSString *src, NSString *dst, BOOL *stop) {
		[outStr replaceOccurrencesOfString:src
								withString:dst
								   options:0
									 range:NSMakeRange(0, outStr.length)];
	}];
	
	return [NSString stringWithString:outStr];	// make non-mutable
}

@end
