//
//  ChildWordView.h
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OnHomeATuShengTouch)();
typedef void(^OnHomeGongzhuTouch)();
typedef void(^OnHomeSleepTouch)();
typedef void(^OnHomeYearsTouch)();

typedef void(^OnHomeBookMoreClick)();


@interface ChildWordView : UIView

@property (nonatomic,copy)OnHomeATuShengTouch aTuShengTouch;
@property (nonatomic,copy)OnHomeSleepTouch sleepTouch;
@property (nonatomic,copy)OnHomeGongzhuTouch gongZhuTouch;
@property (nonatomic,copy)OnHomeYearsTouch yearsTouch;

@property (nonatomic, copy)OnHomeBookMoreClick moreClick;

-(void)showInView:(UIView*)hostView aTusheng:(void(^)())aTushengClick sleep:(void(^)())sleep gongzhu:(void(^)())gongzhuClick years:(void(^)())yearsClick more:(void(^)())moreClick;


@end
