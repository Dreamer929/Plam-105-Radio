//
//  BookTuijianView.m
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "BookTuijianView.h"

@implementation BookTuijianView

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
        self.frame = CGRectMake(0, 190+80+10+120+10, DREAMCSCREEN_W, 180);
        self.backgroundColor = [UIColor whiteColor];
        [self setUpView];
    }
    return self;
}
-(void)setUpView{
    
    UIImageView *flagImg = [[UIImageView alloc]init];
    flagImg.backgroundColor = [UIColor orangeColor];
    [self addSubview:flagImg];
    [flagImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(8);
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(5);
    }];
    
    UILabel *flagLable = [[UILabel alloc]init];
    flagLable.text = @"书籍推荐";
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
    [moreBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    moreBtn.backgroundColor = [UIColor orangeColor];
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

    UIImageView *lhzImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"lihongzhang")];
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
    
    UIImageView *wLImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"wangli")];
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
    
    UIImageView *LybImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"langyabang")];
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
    
    UIImageView *mcsImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"mingchao")];
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

-(void)showInView:(UIView *)hostView lhzClick:(void (^)())lhzTouch lybClick:(void (^)())lybTouch wLClick:(void (^)())wLClick mCSClick:(void (^)())mCSTouch moreClick:(void (^)())moreTouch{
    [hostView addSubview:self];
    self.moreBookClick = moreTouch;
    self.lHZTouch = lhzTouch;
    self.wLTouch = wLClick;
    self.mCSTouch = mCSTouch;
    self.lYBTouch = lybTouch;
}


#pragma mark -click

-(void)moreClick:(UIButton*)sender{
   
    if (self.moreBookClick) {
        self.moreBookClick();
    }
}

-(void)lhzClick:(UITapGestureRecognizer*)tap{
   
    NSInteger imgTag = tap.view.tag;
    switch (imgTag) {
        case 10:
            {
                if (self.lHZTouch) {
                    self.lHZTouch();
                }
            }
            break;
        case 11:
        {
            if (self.wLTouch) {
                self.wLTouch();
            }
        }
            break;
        case 12:
        {
            if (self.lYBTouch) {
                self.lYBTouch();
            }
        }
            break;
        case 13:
        {
            if (self.mCSTouch) {
                self.mCSTouch();
            }
        }
            break;
        default:
            break;
    }
}

@end
