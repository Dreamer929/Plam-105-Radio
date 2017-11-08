//
//  HealthView.h
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^OnHomeYangshengTouch)();
typedef void(^OnHomeJianfeiTouch)();
typedef void(^OnHomeMingyiTouch)();
typedef void(^OnHomeZhenjiuTouch)();

typedef void(^OnHomeBookMoreClick)();

@interface HealthView : UIView

@property (nonatomic,copy)OnHomeYangshengTouch yangShengTouch;
@property (nonatomic,copy)OnHomeJianfeiTouch jianFeiTouch;
@property (nonatomic,copy)OnHomeMingyiTouch mingYiTouch;
@property (nonatomic,copy)OnHomeZhenjiuTouch zhenJiuTouch;

@property (nonatomic, copy)OnHomeBookMoreClick moreClick;

-(void)showInView:(UIView*)hostView yangSheng:(void(^)())yangShengClick jianfei:(void(^)())jianfeiClick mingYi:(void(^)())mingYiClick zhengJiu:(void(^)())zhenJiuClick more:(void(^)())moreClick;

@end
