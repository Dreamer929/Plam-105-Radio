//
//  MoxiConfig.h
//  LuckProject
//
//  Created by moxi on 2017/11/2.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString *const HISTORY_KEY;

@interface MoxiConfig : NSObject

@property (nonatomic, copy)NSString *history;

+(instancetype)shareInstance;
-(void)saveHistory:(NSString *)string;

@end
