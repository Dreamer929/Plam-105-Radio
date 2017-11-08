//
//  HomeFMView.h
//  LuckProject
//
//  Created by moxi on 2017/10/27.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OnHomeFMCYTouch)();
typedef void(^OnHomeFMSleepWLTouch)();
typedef void(^OnHomeFMFSTouch)();
typedef void(^OnHomeFMCuTouch)();

@interface HomeFMView : UIView
@property (nonatomic,copy)OnHomeFMCYTouch chengyiTouch;
@property (nonatomic,copy)OnHomeFMSleepWLTouch sleepTouch;
@property (nonatomic,copy)OnHomeFMFSTouch fengshuiTouch;
@property (nonatomic,copy)OnHomeFMCuTouch cuTouch;

-(void)showInView:(UIView*)hostView chengyi:(void(^)())cyClick sleep:(void(^)())sbzClick fengshui:(void(^)())fsClick cu:(void(^)())cuClick;
@end
