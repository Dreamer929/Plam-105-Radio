//
//  HomeTuijianView.h
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OnHomePomeTuijianTouch)();
typedef void(^OnHomeFMTuijianTouch)();

@interface HomeTuijianView : UIView
@property (nonatomic, copy)OnHomePomeTuijianTouch   onHomePoemTuijianClick;
@property (nonatomic, copy)OnHomeFMTuijianTouch     onHomeFMTuijianClick;

-(void)showInview:(UIView*)hostview pomeClick:(void(^)())pomeTouch FMClick:(void(^)())FMTouch;

@end
