
//
//  UUID.m
//  KeychainDemo
//
//  Created by vicki753-mac on 13/11/2017.
//  Copyright © 2017 zhengyi. All rights reserved.
//

#import "UUID.h"
#import "KeychainStore.h"

@implementation UUID

+(NSString *)getUUID{
    NSString *strUUID = (NSString *)[KeychainStore load:KEY_USERNAME_PASSWORD];
    if ([strUUID isEqualToString:@""] || !strUUID) {
        CFUUIDRef uuidRef = CFUUIDCreate(kCFAllocatorDefault);
        strUUID = (NSString *)CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidRef));
        
        //保存keychain
        [KeychainStore save:KEY_USERNAME_PASSWORD data:strUUID];
    }
    return strUUID;
}
+(NSString *)getUserName{
    NSString *username = (NSString *)[KeychainStore load:KEY_USERNAME];
    return username;
}
+(NSString *)getUserPasword{
    NSString *password = (NSString *)[KeychainStore load:KEY_PASSWORD];
    return password;
}

+(void)setUserName:(NSString *)userName{
    if (![userName isEqualToString:@""] || userName) {
        [KeychainStore save:KEY_USERNAME data:userName];
    }
}
+(void)setPasswordName:(NSString *)password{
    if (![password isEqualToString:@""] || password) {
        [KeychainStore save:KEY_PASSWORD data:password];
    }
}

@end
