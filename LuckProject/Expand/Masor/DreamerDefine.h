//
//  DreamerDefine.h
//  LuckProject
//
//  Created by moxi on 2017/6/25.
//  Copyright © 2017年 moxi. All rights reserved.
//

#ifndef DreamerDefine_h
#define DreamerDefine_h



#define ECIMAGENAME(_name_) [UIImage imageNamed:_name_]

#define ECCOLOR(r, g, b, a)             [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]


#define DREAMSCREEN          [[UIScreen mainScreen] bounds]
#define DREAMCSCREEN_W        [[UIScreen mainScreen]bounds].size.width
#define DREAMCSCREEN_H        [[UIScreen mainScreen]bounds].size.height

#define IMGURLS [[NSArray alloc]initWithObjects:@"http:\/\/fdfs.xmcdn.com\/group14\/M02\/A6\/92\/wKgDZFZPzzaixoYRAABpHb2UGDM141_mobile_large.jpg",@"http:\/\/fdfs.xmcdn.com\/group31\/M04\/23\/88\/wKgJSVmBrKOzYGThAAA_kYwYPS4014_mobile_large.jpg",@"http:\/\/fdfs.xmcdn.com\/group8\/M05\/E8\/17\/wKgDYFaceLyRkHBoAAE2Fpw5lWM028_mobile_large.jpg",@"http:\/\/fdfs.xmcdn.com\/group2\/M00\/2C\/32\/wKgDr1HccXPRa-sIAAD_sPw_f-Q851_mobile_meduim.jpg", nil]

#define ZYXIMGS  [[NSArray alloc]initWithObjects:@"http:\/\/fdfs.xmcdn.com\/group32\/M0B\/B1\/0C\/wKgJUFn6hFGTPm4PAAFOpbmvZwo194_mobile_large.jpg",@"http://fdfs.xmcdn.com//group11//M09//1A//42//wKgDa1V0EKnjUwZXAAK_26u4kpw868_mobile_large.jpg",@"http://fdfs.xmcdn.com//group28//M09//42//53//wKgJSFlVoYLBduhQAAK6rHvsaRo517_mobile_large.png",@"http://fdfs.xmcdn.com//group27//M00//AE//4F//wKgJR1kX50uT4aP7AACkI6S2GXs619_mobile_large.jpg",@"http://fdfs.xmcdn.com//group25//M00//9F//C5//wKgJMVhJEEyzFuMzAAI3A9rK8YM528_mobile_large.jpg", nil]
/**
 *  导入头文件
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <ifaddrs.h>
#import <arpa/inet.h>

#import "AFNetworking.h"
#import "AFNetworkActivityIndicatorManager.h"

#import "Masonry.h"
#import "MBProgressHUD.h"
#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "YYCache.h"


#import "RootViewController.h"
#import "BaseViewController.h"
#import "FeileiViewController.h"
#import "HomeViewController.h"
#import "PindaoViewController.h"
#import "MusicPlayerViewController.h"
#import "SearchViewController.h"


#import "MXHttpRequestCache.h"
#import "MXHttpRequestUrl.h"
#import "MXHttpRequestManger.h"


#import "RootModel.h"



#endif /* DreamerDefine_h */
