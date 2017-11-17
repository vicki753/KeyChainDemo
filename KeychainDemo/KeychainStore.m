//
//  KeychainStore.m
//  KeychainDemo
//
//  Created by vicki753-mac on 13/11/2017.
//  Copyright © 2017 zhengyi. All rights reserved.
//

#import "KeychainStore.h"

@implementation KeychainStore

+(NSMutableDictionary *)getKeychainQuery:(NSString *)service{
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:(id)kSecClassGenericPassword, (id)kSecClass, service, (id)kSecAttrAccount, (id)kSecAttrAccessibleAfterFirstUnlock, (id)kSecAttrAccessible, nil];
}


+(void)save:(NSString *)service data:(id)data{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery); // 删除之前的
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData]; //用键值对 归档存储
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);//添加现在的
}

+(id)load:(NSString *)service{
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        @try{
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge NSData *)keyData];
        }@catch (NSException *e){
            NSLog(@"Unarchive of %@ failed: %@", service, e);
        }@finally {
            
        }
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
    
}

+(void)deleteKeyData:(NSString *)service{
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((CFDictionaryRef)keychainQuery);
}


@end
