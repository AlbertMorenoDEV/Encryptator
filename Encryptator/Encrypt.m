//
//  Encrypt.m
//  Encryptator
//
//  Created by albert moreno vendrell on 17/11/13.
//  Copyright (c) 2013 Albert Moreno Vendrell. All rights reserved.
//

#import "Encrypt.h"
#import <CommonCrypto/CommonDigest.h>

@implementation Encrypt

+ (NSString*)md5:(NSString*)input {
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

@end
