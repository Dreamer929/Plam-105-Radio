//
//  MoxiConfig.m
//  LuckProject
//
//  Created by moxi on 2017/11/2.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "MoxiConfig.h"

NSString *const HISTORY_KEY = @"history_key";

@implementation MoxiConfig

+(instancetype)shareInstance{
    
    static id shareInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[MoxiConfig alloc]init];
    });
    
    [shareInstance loadUserInfo];
    return shareInstance;
}

-(void)loadUserInfo{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults objectForKey:HISTORY_KEY]!= nil) {
        self.history = [defaults objectForKey:HISTORY_KEY];
    }else{
        self.history = nil;
    }
}

-(void)saveInfo{
    NSUserDefaults *defauls = [NSUserDefaults standardUserDefaults];
    
    [defauls setObject:self.history forKey:HISTORY_KEY];
    
    [defauls synchronize];
}

-(void)saveHistory:(NSString *)string{
    
    self.history = string;
    [self saveInfo];
}

@end
