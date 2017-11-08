//
//  HealthView.m
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "HealthView.h"

@implementation HealthView

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
        self.frame = CGRectMake(0, 190 + 80+10+120+10+180 + 10 + 180 + 10, DREAMCSCREEN_W, 180);
        self.backgroundColor = [UIColor whiteColor];
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    
    UIImageView *flagImg = [[UIImageView alloc]init];
    flagImg.backgroundColor = ECCOLOR(58, 1164, 250, 1);
    [self addSubview:flagImg];
    [flagImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(8);
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(5);
    }];
    
    UILabel *flagLable = [[UILabel alloc]init];
    flagLable.text = @"健康养生";
    flagLable.textAlignment = NSTextAlignmentLeft;
    [self addSubview:flagLable];
    [flagLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.left.mas_equalTo(flagImg.mas_right).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [moreBtn setTitle:@"更多" forState:UIControlStateNormal];
    moreBtn.layer.cornerRadius = 15;
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    moreBtn.layer.masksToBounds = YES;
    [moreBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    moreBtn.backgroundColor = ECCOLOR(58, 1164, 250, 1);
    [moreBtn addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreBtn];
    [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
    
    CGFloat toLeftPad = 10;
    CGFloat bookPad = 10;
    CGFloat bookWidth = (DREAMCSCREEN_W - 20 - 3*10)/4;
    
    UIImageView *lhzImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"yangsheng")];
    lhzImg.userInteractionEnabled = YES;
    lhzImg.tag = 10;
    [lhzImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lhzClick:)] ];
    [self addSubview:lhzImg];
    [lhzImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(flagLable.mas_bottom).offset(15);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-15);
        make.left.mas_equalTo(self.mas_left).offset(toLeftPad);
        make.width.mas_equalTo(bookWidth);
    }];
    
    UIImageView *wLImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"jianfei")];
    wLImg.userInteractionEnabled = YES;
    wLImg.tag = 11;
    [wLImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lhzClick:)] ];
    [self addSubview:wLImg];
    [wLImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(flagLable.mas_bottom).offset(15);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-15);
        make.left.mas_equalTo(lhzImg.mas_right).offset(bookPad);
        make.width.mas_equalTo(bookWidth);
    }];
    
    UIImageView *LybImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"zhongyi")];
    LybImg.userInteractionEnabled = YES;
    LybImg.tag = 12;
    [LybImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lhzClick:)] ];
    [self addSubview:LybImg];
    [LybImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(flagLable.mas_bottom).offset(15);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-15);
        make.left.mas_equalTo(wLImg.mas_right).offset(bookPad);
        make.width.mas_equalTo(bookWidth);
    }];
    
    UIImageView *mcsImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"zhenjiu")];
    mcsImg.userInteractionEnabled = YES;
    mcsImg.tag = 13;
    [mcsImg addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lhzClick:)] ];
    [self addSubview:mcsImg];
    [mcsImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(flagLable.mas_bottom).offset(15);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-15);
        make.left.mas_equalTo(LybImg.mas_right).offset(bookPad);
        make.width.mas_equalTo(bookWidth);
    }];
}

-(void)showInView:(UIView *)hostView yangSheng:(void (^)())yangShengClick jianfei:(void (^)())jianfeiClick mingYi:(void (^)())mingYiClick zhengJiu:(void (^)())zhenJiuClick more:(void (^)())moreClick{
    
    [hostView addSubview:self];
    self.moreClick = moreClick;
    self.yangShengTouch = yangShengClick;
    self.jianFeiTouch  = jianfeiClick;
    self.mingYiTouch  = mingYiClick;
    self.zhenJiuTouch  = zhenJiuClick;
}

#pragma mark -click

-(void)moreClick:(UIButton*)sender{
    
    if (self.moreClick) {
        self.moreClick();
    }
}

-(void)lhzClick:(UITapGestureRecognizer*)tap{
    
    NSInteger imgTag = tap.view.tag;
    switch (imgTag) {
        case 10:
        {
            if (self.yangShengTouch) {
                self.yangShengTouch();
            }
        }
            break;
        case 11:
        {
            if (self.jianFeiTouch) {
                self.jianFeiTouch();
            }
        }
            break;
        case 12:
        {
            if (self.mingYiTouch) {
                self.mingYiTouch();
            }
        }
            break;
        case 13:
        {
            if (self.zhenJiuTouch) {
                self.zhenJiuTouch();
            }
        }
            break;
        default:
            break;
    }
}



@end
