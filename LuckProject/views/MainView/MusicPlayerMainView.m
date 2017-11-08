//
//  MusicPlayerMainView.m
//  LuckProject
//
//  Created by moxi on 2017/11/3.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "MusicPlayerMainView.h"

@implementation MusicPlayerMainView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self setUPview];
    }
    return self;
}

-(void)setUPview{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    imageView.image = ECIMAGENAME(@"mianView");
    [self addSubview:imageView];
    [UIView animateWithDuration:3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
