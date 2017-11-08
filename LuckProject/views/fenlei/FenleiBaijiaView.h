//
//  FenleiBaijiaView.h
//  LuckProject
//
//  Created by moxi on 2017/11/1.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface FenleiBaijiaView : UIView

@property (nonatomic,copy) void(^viewBlock)(NSInteger index);

-(instancetype)initWithFrame:(CGRect)frame titleFlag:(NSString*)titleStr imageURLs:(NSArray*)images titles:(NSArray*)titles callBack:(void(^)(NSInteger index))selectview;

@end
