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

+ (NSString*)sha1:(NSString*)input
{
    unsigned char result[CC_SHA1_DIGEST_LENGTH];
    NSData *stringBytes = [input dataUsingEncoding: NSUTF8StringEncoding]; /* or some other encoding */
    CC_SHA1([stringBytes bytes], [stringBytes length], result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

+ (NSString*)md5:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

+ (NSString*)base64:(NSString*)input
{
    //Point to start of the data and set buffer sizes
    int inLength = [input length];
    int outLength = ((((inLength * 4)/3)/4)*4) + (((inLength * 4)/3)%4 ? 4 : 0);
    NSData *stringBytes = [input dataUsingEncoding: NSUTF8StringEncoding]; /* or some other encoding */
    const char *inputBuffer = [stringBytes bytes];
    char *outputBuffer = malloc(outLength+1);
    outputBuffer[outLength] = 0;
    
    //64 digit code
    static char Encode[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    
    //start the count
    int cycle = 0;
    int inpos = 0;
    int outpos = 0;
    char temp;
    
    //Pad the last to bytes, the outbuffer must always be a multiple of 4
    outputBuffer[outLength-1] = '=';
    outputBuffer[outLength-2] = '=';
    
    /* http://en.wikipedia.org/wiki/Base64
     Text content   M           a           n
     ASCII          77          97          110
     8 Bit pattern  01001101    01100001    01101110
     
     6 Bit pattern  010011  010110  000101  101110
     Index          19      22      5       46
     Base64-encoded T       W       F       u
     */
    
    
    while (inpos < inLength){
        switch (cycle) {
            case 0:
                outputBuffer[outpos++] = Encode[(inputBuffer[inpos]&0xFC)>>2];
                cycle = 1;
                break;
            case 1:
                temp = (inputBuffer[inpos++]&0x03)<<4;
                outputBuffer[outpos] = Encode[temp];
                cycle = 2;
                break;
            case 2:
                outputBuffer[outpos++] = Encode[temp|(inputBuffer[inpos]&0xF0)>> 4];
                temp = (inputBuffer[inpos++]&0x0F)<<2;
                outputBuffer[outpos] = Encode[temp];
                cycle = 3;
                break;
            case 3:
                outputBuffer[outpos++] = Encode[temp|(inputBuffer[inpos]&0xC0)>>6];
                cycle = 4;
                break;
            case 4:
                outputBuffer[outpos++] = Encode[inputBuffer[inpos++]&0x3f];
                cycle = 0;
                break;
            default:
                cycle = 0;
                break;
        }
    }
    NSString *pictemp = [NSString stringWithUTF8String:outputBuffer];
    free(outputBuffer);
    return pictemp;
}

+ (NSString*)crc32:(NSString*)input
{
    NSMutableString *ret = [NSMutableString stringWithCapacity:2];
    return ret;
}

@end
