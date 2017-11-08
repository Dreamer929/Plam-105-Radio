//
//  BookTuijianView.h
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OnHomeBookLHZTouch)();
typedef void(^OnHomeBookWLTouch)();
typedef void(^OnHomeBookLYBTouch)();
typedef void(^OnHomeBookMCNTouch)();
typedef void(^OnHomeBookMoreClick)();

@interface BookTuijianView : UIView

@property (nonatomic,copy)OnHomeBookLHZTouch lHZTouch;
@property (nonatomic,copy)OnHomeBookLYBTouch lYBTouch;
@property (nonatomic,copy)OnHomeBookWLTouch wLTouch;
@property (nonatomic,copy)OnHomeBookMCNTouch mCSTouch;

@property (nonatomic,copy)OnHomeBookMoreClick moreBookClick;

-(void)showInView:(UIView*)hostView lhzClick:(void(^)())lhzTouch lybClick:(void(^)())lybTouch wLClick:(void(^)())wLClick mCSClick:(void(^)())mCSTouch moreClick:(void(^)())moreTouch;

@end
