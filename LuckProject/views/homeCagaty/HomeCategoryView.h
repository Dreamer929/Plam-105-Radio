//
//  HomeCategoryView.h
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OnHomeChildTouch)();
typedef void(^OnHomeSchollTouch)();
typedef void(^OnHomeBookTouch)();
typedef void(^OnHomeHistoryTouch)();

@interface HomeCategoryView : UIView

@property (nonatomic, copy)OnHomeChildTouch   onHomeChildClick;
@property (nonatomic, copy)OnHomeSchollTouch  onHomeSchollClick;
@property (nonatomic, copy)OnHomeBookTouch    onHomeBookClick;
@property (nonatomic, copy)OnHomeHistoryTouch onHomeHistoyrClick;


-(void)showInview:(UIView*)hostView childBlock:(void(^)())childTouch schollBlock:(void(^)())schollTouch bookBlock:(void(^)())bookTouch historyBlock:(void(^)())historyTouch;

@end
