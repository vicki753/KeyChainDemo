//
//  KeychainStore.h
//  KeychainDemo
//
//  Created by vicki753-mac on 13/11/2017.
//  Copyright © 2017 zhengyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainStore : NSObject

+(void)save:(NSString *)service data:(id)data;
+(id)load:(NSString *)service;
+(void)deleteKeyData:(NSString *)service;

@end
