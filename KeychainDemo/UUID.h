//
//  UUID.h
//  KeychainDemo
//
//  Created by vicki753-mac on 13/11/2017.
//  Copyright © 2017 zhengyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UUID : NSObject




+(NSString *)getUUID;
+(NSString *)getUserName;
+(NSString *)getUserPasword;

+(void)setUserName:(NSString *)userName;
+(void)setPasswordName:(NSString *)password;


@end
