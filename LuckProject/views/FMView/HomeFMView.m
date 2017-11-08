//
//  HomeFMView.m
//  LuckProject
//
//  Created by moxi on 2017/10/27.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "HomeFMView.h"

@implementation HomeFMView

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
        self.frame = CGRectMake(0, 980+760, DREAMCSCREEN_W, 130);
        self.backgroundColor = [UIColor whiteColor];
        [self setUpview];
    }
    return self;
}

-(void)setUpview{
    UIImageView *flagImg = [[UIImageView alloc]init];
    flagImg.backgroundColor = [UIColor redColor];
    [self addSubview:flagImg];
    [flagImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(8);
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(5);
    }];
    
    UILabel *flagLable = [[UILabel alloc]init];
    flagLable.text = @"我的电台";
    flagLable.textAlignment = NSTextAlignmentLeft;
    [self addSubview:flagLable];
    [flagLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.left.mas_equalTo(flagImg.mas_right).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    CGFloat imgPad = (DREAMCSCREEN_W - 70*4)/5;
    NSArray *imgArr = @[@"chengyi",@"shuibuzhao",@"fengshui",@"cu"];
    NSArray *titelArr = @[@"CYFM",@"陪你入睡",@"风水学",@"加点料"];
    
    for (NSInteger idnex = 0; idnex<=3; idnex++) {
        UIImageView *img = [[UIImageView alloc]initWithImage:ECIMAGENAME(imgArr[idnex])];
        img.userInteractionEnabled = YES;
        img.layer.cornerRadius = 35;
        img.layer.masksToBounds = YES;
        img.tag = idnex + 10;
        [img addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fmClick:)]];
        [self addSubview:img];
        
        UILabel *title = [[UILabel alloc]init];
        title.text = titelArr[idnex];
        title.font = [UIFont systemFontOfSize:15];
        title.textColor = [UIColor blackColor];
        title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:title];
        
        [img mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(flagLable.mas_bottom);
            make.left.mas_equalTo(self.mas_left).offset(imgPad + (imgPad + 70)*idnex);
            make.height.mas_equalTo(70);
            make.width.mas_equalTo(70);
        }];
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(img.mas_bottom);
            make.centerX.mas_equalTo(img.mas_centerX);
            make.width.mas_equalTo(70);
            make.height.mas_equalTo(30);
        }];
    }
    
}

-(void)showInView:(UIView *)hostView chengyi:(void (^)())cyClick sleep:(void (^)())sbzClick fengshui:(void (^)())fsClick cu:(void (^)())cuClick{
    [hostView addSubview:self];
    self.chengyiTouch = cyClick;
    self.sleepTouch = sbzClick;
    self.fengshuiTouch = fsClick;
    self.cuTouch = cuClick;
}

#pragma mark -click

-(void)fmClick:(UITapGestureRecognizer*)tap{
    
    NSInteger index = tap.view.tag;
    switch (index) {
        case 10:
            {
                if (self.chengyiTouch) {
                    self.chengyiTouch();
                }
            }
            break;
        case 11:
        {
            if (self.sleepTouch) {
                self.sleepTouch();
            }
        }
            break;
        case 12:
        {
            if (self.fengshuiTouch) {
                self.fengshuiTouch();
            }
        }
            break;
        case 13:
        {
            if (self.cuTouch) {
                self.cuTouch();
            }
        }
            break;
            
        default:
            break;
    }
}


@end
