//
//  MoxiMusicAPI.m
//  LuckProject
//
//  Created by moxi on 2017/10/25.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "MoxiMusicAPI.h"

@implementation MoxiMusicAPI

+(void)getListHomeCaregaty:(HomeGuideCaregaty)homeguide page:(NSInteger)page callBackData:(void (^)(NSMutableArray *, NSString *))block{
    NSString *url = @"album.list.php?";
    NSString *keyword = [NSString string];
    NSString *albumId = [NSString string];
    switch (homeguide) {
        case HomeGuideSanwen:
        {
            keyword = @"美到心碎的散文";
            albumId = @"3238854";
        }
            break;
        case HomeGuideSound:
            {
                keyword = @"电音大全";
                albumId = @"2988375";
            }
            break;
        case HomeGuideGuitar:
        {
            keyword = @"经典古典吉他";
            albumId = @"191346";
        }
            break;
        case HomeGuideGushiHui:
        {
            keyword = @"名家故事汇";
            albumId = @"3228566";
        }
            break;
        case HomeSeconedChild:
        {
            keyword = @"新派童话故事";
            albumId = @"349623";
        }
            break;
        case HomeSeconedSchool:
        {
            keyword = @"3哈佛大学公开课：幸福课";
            albumId = @"3619758";
        }
            break;
        case HomeSeconedRead:
        {
            keyword = @"外国短篇小说";
            albumId = @"2801790";
        }
            break;
        case HomeSeconedHistory:
        {
            keyword = @"国史通鉴";
            albumId = @"2952289";
        }
            break;
        case HomeThirdPoem:
        {
            keyword = @"散落的诗歌";
            albumId = @"222980";
        }
            break;
        case HomeThirdMusic:
        {
            keyword = @"最动听的纯音乐";
            albumId = @"215751";
        }
            break;
        case HomeTalkShowFirst:
        {
            keyword = @"上班脱口秀";
            albumId = @"336435";
        }
            break;
        case HomeTaskShowSecond:
        {
            keyword = @"方清平脱口秀搞笑全集";
            albumId = @"6360993";
        }
            break;
        case HomeTaskShowThird:
        {
            keyword = @"小沈龙脱口秀";
            albumId = @"9373694";
        }
            break;
        case HomeTaskShowFourth:
        {
            keyword = @"东北话脱口秀";
            albumId = @"239837";
        }
            break;
        case HomeFMFirst:
        {
            keyword = @"程一电台";
            albumId = @"260769";
        }
            break;
        case HomeFMSecond:
        {
            keyword = @"睡不着电台";
            albumId = @"3609736";
        }
            break;
        case HomeFMThitd:
        {
            keyword = @"风水玄学";
            albumId = @"4842885";
        }
            break;
        case HomeFMFourth:
        {
            keyword = @"半瓶醋电台";
            albumId = @"338924";
        }
            break;
        case FenleiZhiyuXiFirst:
        {
            keyword = @"许莫爱音乐";
            albumId = @"6093729";
        }
            break;
        case FenleiZhiyuXiSecond:
        {
            keyword = @"净心音乐";
            albumId = @"2672258";
        }
            break;
        case FenleiZhiyuXiThird:
        {
            keyword = @"枕边音乐";
            albumId = @"4782723";
        }
            break;
        case FenleiZhiyuxiFourth:
        {
            keyword = @"夏小薇的音乐时代";
            albumId = @"10670723";
        }
            break;
        case FenleiZhiyuxiFirth:
        {
            keyword = @"自然能量音乐";
            albumId = @"6093814";
        }
            break;
  
        default:
            break;
    }
    NSDictionary *dic = @{
                          @"albumId":albumId,
                          @"albumTitle":keyword,
                          @"p":[NSString stringWithFormat:@"%ld",page],
                          @"pagesize":@"20",
                          };
    [MXHttpRequestManger GET:[BASE_URL stringByAppendingString:url] parameters:dic success:^(id responseObject) {
        
        NSArray *arr = responseObject[@"items"];
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            DetialModel *model = [[DetialModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [modelArray addObject:model];
        }
        block(modelArray,nil);

    } failure:^(NSError *error) {
        
        block(nil,error.userInfo[@"NSLocalizedDescription"]);
        
    }];
}

+(void)getHomeSeconed:(HomeTuijian)homeCarety page:(NSInteger)page callBackData:(void (^)(NSMutableArray *, NSString *))block{

    //http://iapi.ipadown.com/api/ting/ximalaya.search.album.php?keyword=万历十五年&p=1&pagesize=2
    /*书籍推荐：万历十五年 http://iapi.ipadown.com/api/ting/ximalaya.album.list.php?p=1&albumId=294090&albumTitle=万历十五年&pagesize=20
     李鸿章传记 http://iapi.ipadown.com/api/ting/ximalaya.album.list.php?p=1&albumId=10209869&albumTitle=李鸿章传记&pagesize=20
     琅琊榜 http://iapi.ipadown.com/api/ting/ximalaya.album.list.php?p=1&albumId=3241478&albumTitle=琅琊榜1——有声小说&pagesize=20
     明朝那些事儿 http://iapi.ipadown.com/api/ting/ximalaya.album.list.php?p=1&albumId=303234&albumTitle=明朝那些事儿&pagesize=20*/

    NSString *url = @"search.album.php?";
    NSString *keyword = [NSString string];

    switch (homeCarety) {
        case HomeTuijianFirst:
            {
                keyword = @"李鸿章传";
            }
            break;
        case HomeTuijianSeconed:
        {
            keyword = @"琅琊榜";
        }
            break;
        case HomeTuijianThird:
        {
            keyword = @"万历十五年";
        }
            break;
        case HomeYTuijianFouth:
        {
            keyword = @"明朝那些事儿";
        }
            break;
        case HomeChildGeLin:
        {
            keyword = @"安徒生童话";
        }
            break;
        case HomeChildSleep:
        {
            keyword = @"儿童睡前小故事";
        }
            break;
        case HomeChildGongzhu:
        {
            keyword = @"公主童话";
        }
            break;
        case HOmeChildYears:
        {
            keyword = @"365夜童话故事";
        }
            break;
        case HomeHealthFirst:
        {
            keyword = @"养生";
        }
            break;
        case HomeHealthSecond:
        {
            keyword = @"减肥";
        }
            break;
        case HomeHealthThird:
        {
            keyword = @"中医频道";
        }
            break;
        case HomeHealthFourth:
        {
            keyword = @"针灸";
        }
            break;
        default:
            break;
    }
    NSDictionary *dic = @{
                          @"keyword":keyword,
                          };
    [MXHttpRequestManger GET:[BASE_URL stringByAppendingString:url] parameters:dic success:^(id responseObject) {
        NSArray *arr = responseObject[@"items"];
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            ListModel *model = [[ListModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [modelArray addObject:model];
        }
        block(modelArray,nil);

        
    } failure:^(NSError *error) {
        block(nil,error.userInfo[@"NSLocalizedDescription"]);

    }];
}

+(void)getShiCiDetialListByModel:(ListModel *)model page:(NSInteger)page callBlack:(void (^)(NSMutableArray *data,NSString *error))block{
    
    NSString *url = @"album.list.php?";
    NSDictionary *dic = @{
                          @"albumId":[NSString stringWithFormat:@"%ld",model.id],
                          @"albumTitle":model.title,
                          @"p":[NSString stringWithFormat:@"%ld",page],
                          @"pagesize":[NSString stringWithFormat:@"%d",20]
                          };
    
    [MXHttpRequestManger GET:[BASE_URL stringByAppendingString:url] parameters:dic success:^(id responseObject) {
        
        NSArray *arr = responseObject[@"items"];
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            DetialModel*model = [[DetialModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [modelArray addObject:model];
        }
        block(modelArray,nil);
        
    } failure:^(NSError *error) {
        block(nil,error.userInfo[@"NSLocalizedDescription"]);
        
    }];
    
}

+(void)getMoreListBykeyword:(NSString *)keyword page:(NSInteger)page callBack:(void (^)(NSMutableArray *, NSString *))block{
    
    // http://iapi.ipadown.com/api/ting/ximalaya.search.album.php?keyword=外国文学&p=1&pagesize=20
    NSString *url = @"search.album.php?";
    NSDictionary *dic = @{
                          @"keyword":keyword,
                          @"p":[NSString stringWithFormat:@"%ld",page],
                          @"pagesize":@"20",
                          };
    
    [MXHttpRequestManger GET:[BASE_URL stringByAppendingString:url] parameters:dic success:^(id responseObject) {
        
        NSArray *arr = responseObject[@"items"];
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            ListModel *model = [[ListModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [modelArray addObject:model];
        }
        block(modelArray,nil);
        
    } failure:^(NSError *error) {
        
        block(nil,error.userInfo[@"NSLocalizedDescription"]);
        
    }];
    
}

+(void)getSearchByKeyWord:(NSString *)keyword page:(NSInteger)page callBlock:(void (^)(NSMutableArray *, NSString *))block{
    
    
    NSString *url = @"search.album.php?";
  
    NSDictionary *dic = @{
                          @"keyword":keyword,
                          @"p":[NSString stringWithFormat:@"%ld",page],
                          @"pagesize":@"20"
                          };
    [MXHttpRequestManger GET:[BASE_URL stringByAppendingString:url] parameters:dic success:^(id responseObject) {
        
        NSArray *arr = responseObject[@"items"];
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dic in arr) {
            ListModel*model = [[ListModel alloc]init];
            [model setValuesForKeysWithDictionary:dic];
            [modelArray addObject:model];
        }
        block(modelArray,nil);
        
    } failure:^(NSError *error) {
        block(nil,error.userInfo[@"NSLocalizedDescription"]);
    }];
}


@end
