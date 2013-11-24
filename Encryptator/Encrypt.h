//
//  Encrypt.h
//  Encryptator
//
//  Created by albert moreno vendrell on 17/11/13.
//  Copyright (c) 2013 Albert Moreno Vendrell. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Encrypt : NSObject
+ (NSString*)sha1:(NSString*)input;
+ (NSString*)md5:(NSString*)input;
+ (NSString*)base64:(NSString*)input;
+ (NSString*)crc32:(NSString*)input;
@end
