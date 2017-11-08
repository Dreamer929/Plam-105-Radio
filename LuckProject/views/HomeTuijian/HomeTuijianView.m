//
//  HomeTuijianView.m
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "HomeTuijianView.h"

@interface HomeTuijianView()


@end

@implementation HomeTuijianView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)init{
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 190+80+10, DREAMCSCREEN_W, 120);
        self.backgroundColor = [UIColor whiteColor];
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    UIImageView *padImg = [[UIImageView alloc]init];
    padImg.backgroundColor = ECCOLOR(240, 240, 240, 1);
    [self addSubview:padImg];
    [padImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.mas_centerY);
        make.left.mas_equalTo(self.mas_left).offset(70);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_equalTo(1);
    }];
    
    UIView *peomView = [[UIView alloc]init];
    [peomView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(peomClick:)]];
    [self addSubview:peomView];
    [peomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(padImg.mas_top);
    }];
    UIImageView *poemImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"poem")];
    poemImg.layer.cornerRadius = 25;
    poemImg.layer.masksToBounds = YES;
    poemImg.userInteractionEnabled = YES;
    [peomView addSubview:poemImg];
    [poemImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(peomView.mas_centerY);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    UILabel *poemLable = [[UILabel alloc]init];
    poemLable.text = @"我有一所房子，面朝大海，春暖花开";
    poemLable.textColor = [UIColor lightGrayColor];
    poemLable.numberOfLines = 0;
    poemLable.textAlignment = NSTextAlignmentLeft;
    poemLable.font = [UIFont systemFontOfSize:17];
    [peomView addSubview:poemLable];
    [poemLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(poemImg.mas_right).offset(10);
        make.top.mas_equalTo(peomView.mas_top);
        make.bottom.mas_equalTo(peomView.mas_bottom);
        make.right.mas_equalTo(peomView.mas_right).offset(-10);
    }];
    
    
    UIView *FMView = [[UIView alloc]init];
    [FMView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(FMClick:)]];
    [self addSubview:FMView];
    [FMView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(padImg.mas_bottom);
        make.left.mas_equalTo(self.mas_left);
        make.right.mas_equalTo(self.mas_right);
        make.bottom.mas_equalTo(self.mas_bottom);
    }];
    UIImageView *FMImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"mtuijian")];
    FMImg.layer.cornerRadius = 25;
    FMImg.layer.masksToBounds = YES;
    FMImg.userInteractionEnabled = YES;
    [FMView addSubview:FMImg];
    [FMImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(FMView.mas_centerY);
        make.left.mas_equalTo(10);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
    UILabel *FMLable = [[UILabel alloc]init];
    FMLable.text = @"美好的一天，从纯音乐开始！";
    FMLable.textColor = [UIColor lightGrayColor];
    FMLable.numberOfLines = 0;
    FMLable.textAlignment = NSTextAlignmentLeft;
    FMLable.font = [UIFont systemFontOfSize:17];
    [FMView addSubview:FMLable];
    [FMLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(FMImg.mas_right).offset(10);
        make.top.mas_equalTo(FMView.mas_top);
        make.bottom.mas_equalTo(FMView.mas_bottom);
        make.right.mas_equalTo(FMView.mas_right).offset(-10);
    }];
}

-(void)showInview:(UIView *)hostview pomeClick :(void (^)())pomeTouch FMClick:(void (^)())FMTouch{
    [hostview addSubview:self];
    self.onHomePoemTuijianClick = pomeTouch;
    self.onHomeFMTuijianClick = FMTouch;
}

#pragma mark -TouchAction

-(void)peomClick:(UITapGestureRecognizer*)tap{
    
    if (self.onHomePoemTuijianClick) {
        self.onHomePoemTuijianClick();
    }
}

-(void)FMClick:(UITapGestureRecognizer*)tap{
    if (self.onHomeFMTuijianClick) {
        self.onHomeFMTuijianClick();
    }
}

@end
