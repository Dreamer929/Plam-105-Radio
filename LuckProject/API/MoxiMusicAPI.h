//
//  MoxiMusicAPI.h
//  LuckProject
//
//  Created by moxi on 2017/10/25.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, HomeGuideCaregaty){
    HomeGuideSanwen = 0,
    HomeGuideSound,
    HomeGuideGushiHui,
    HomeGuideGuitar,
    HomeSeconedChild ,
    HomeSeconedSchool,
    HomeSeconedRead,
    HomeSeconedHistory,
    HomeThirdPoem ,
    HomeThirdMusic,
    HomeTalkShowFirst,
    HomeTaskShowSecond,
    HomeTaskShowThird,
    HomeTaskShowFourth,
    HomeFMFirst,
    HomeFMSecond,
    HomeFMThitd,
    HomeFMFourth,
    FenleiZhiyuXiFirst,
    FenleiZhiyuXiSecond,
    FenleiZhiyuXiThird,
    FenleiZhiyuxiFourth,
    FenleiZhiyuxiFirth,
};

typedef NS_ENUM(NSInteger,HomeTuijian) {
    HomeTuijianFirst = 0,
    HomeTuijianSeconed,
    HomeTuijianThird,
    HomeYTuijianFouth,
    HomeChildGeLin,
    HomeChildSleep,
    HomeChildGongzhu,
    HOmeChildYears,
    HomeHealthFirst,
    HomeHealthSecond,
    HomeHealthThird,
    HomeHealthFourth,
};

#define BASE_URL @"http://iapi.ipadown.com/api/ting/ximalaya."

#import "ListModel.h"
#import "DetialModel.h"

@interface MoxiMusicAPI : NSObject

+(void)getListHomeCaregaty:(HomeGuideCaregaty)homeguide page:(NSInteger)page callBackData:(void(^)(NSMutableArray*data,NSString*error))block;

+(void)getHomeSeconed:(HomeTuijian)homeCarety page:(NSInteger)page callBackData:(void(^)(NSMutableArray*data,NSString*error))block;

+(void)getShiCiDetialListByModel:(ListModel *)model page:(NSInteger)page callBlack:(void (^)(NSMutableArray *data,NSString *error))block;
+ (void)getMoreListBykeyword:(NSString*)keyword page:(NSInteger)page callBack:(void(^)(NSMutableArray *data,NSString *error))block;

+(void)getSearchByKeyWord:(NSString*)keyword page:(NSInteger)page callBlock:(void(^)(NSMutableArray*data,NSString *error))block;
@end
