//
//  TalkShowView.m
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "TalkShowView.h"

@implementation TalkShowView

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
        self.frame = CGRectMake(0, 980, DREAMCSCREEN_W, 750);
        self.backgroundColor = [UIColor whiteColor];
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
    
    UIImageView *flagImg = [[UIImageView alloc]init];
    flagImg.backgroundColor = ECCOLOR(128, 104, 164, 1);
    [self addSubview:flagImg];
    [flagImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).offset(8);
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(5);
    }];
    
    UILabel *flagLable = [[UILabel alloc]init];
    flagLable.text = @"练习讲话";
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
    moreBtn.backgroundColor = ECCOLOR(128, 104, 164, 1);
    [moreBtn addTarget:self action:@selector(moreClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:moreBtn];
    [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.right.mas_equalTo(self.mas_right).offset(-10);
        make.width.mas_equalTo(70);
        make.height.mas_equalTo(30);
    }];
    
    NSArray *imgArr = @[@"workTS",@"fqpTS",@"xslTS",@"dbhTS"];
    NSArray *titleArr = @[@"上班脱口秀",@"FQP搞笑全集",@"XSLtalkShow",@"不一样的东北话"];
    NSArray *introArr = @[@"每个工作日，帮你整合昨夜今晨的网络热点新闻，用打鸡血的态度和撒狗血的精神振奋你每天的生活",@"《脱口而出》主持人。 2014年，主演由黄明升执导的民国传奇剧《城市猎人》。 2015年，在民国年代剧《乞丐大掌柜》中饰演雍元生一角。 2016年，参演浪漫轻喜剧《爱我@别走",@"xiaoshengLong不一样的说话方式，不一样的精彩，和别人不同的脱口秀",@"诙谐有趣的东北话是不是总能带给你欢声笑语，你也总想学两句，那就来吧"];
    for (NSInteger index = 0; index < 4; index++) {
        
        UIView *workview = [[UIView alloc]init];
        workview.backgroundColor = [UIColor whiteColor];
        workview.tag = 10 + index;
        [workview addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(talkShowClick:)]];
        [self addSubview:workview];
        [workview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(flagLable.mas_bottom).offset(180*index);
            make.left.mas_equalTo(self.mas_left);
            make.right.mas_equalTo(self.mas_right);
            make.height.mas_equalTo(180);
        }];
        UIImageView *workBtmImg = [[UIImageView alloc]init];
        workBtmImg.backgroundColor = ECCOLOR(230, 230, 230, 1);
        [workview addSubview:workBtmImg];
        [workBtmImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(workview.mas_bottom);
            make.left.mas_equalTo(workview.mas_left).offset(120);
            make.right.mas_equalTo(workview.mas_right);
            make.height.mas_equalTo(1);
        }];
        
        UIImageView *workImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(imgArr[index])];
        workImg.userInteractionEnabled = YES;
        [workview addSubview:workImg];
        [workImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(workview.mas_top).offset(15);
            make.left.mas_equalTo(workview.mas_left).offset(10);
            make.right.mas_equalTo(workBtmImg.mas_left).offset(-10);
            make.bottom.mas_equalTo(workBtmImg.mas_top).offset(-15);
        }];
        //上班脱口秀
        UILabel *workTitleLable = [[UILabel alloc]init];
        workTitleLable.text = titleArr[index];
        workTitleLable.textColor = [UIColor blackColor];
        workTitleLable.font = [UIFont systemFontOfSize:19];
        workTitleLable.textAlignment = NSTextAlignmentLeft;
        workTitleLable.textColor = [UIColor blackColor];
        [workview addSubview:workTitleLable];
        [workTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(workview.mas_top).offset(15);
            make.left.mas_equalTo(workImg.mas_right).offset(10);
            make.right.mas_equalTo(workview.mas_right).offset(-20);
            make.height.mas_equalTo(40);
        }];
        
        UILabel *workIntroLable = [[UILabel alloc]init];
        workIntroLable.text = introArr[index];
        workIntroLable.textColor = [UIColor grayColor];
        workIntroLable.textAlignment = NSTextAlignmentLeft;
        workIntroLable.numberOfLines = 0;
        [workview addSubview:workIntroLable];
        
        [workIntroLable mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(workTitleLable.mas_bottom).offset(5);
            make.left.mas_equalTo(workImg.mas_right).offset(10);
            make.right.mas_equalTo(workview.mas_right).offset(-20);
            make.height.mas_equalTo(90);
        }];
    }
    
}

-(void)showInView:(UIView *)hostView work:(void (^)())workClick fqp:(void (^)())fqpClick xsl:(void (^)())xslClick dbh:(void (^)())dbhClick more:(void (^)())moreClick{
    
    [hostView addSubview:self];
    self.workTSTouch = workClick;
    self.fqpTSTouch = fqpClick;
    self.xslTSTouch = xslClick;
    self.dbhTSTouch = dbhClick;
    self.moreClick = moreClick;
}


#pragma mark -click

-(void)moreClick:(UIButton*)button{
    if (self.moreClick) {
        self.moreClick();
    }
}

-(void)talkShowClick:(UITapGestureRecognizer*)tap{
    
    NSInteger index = tap.view.tag;
    switch (index) {
        case 10:
            {
                if (self.workTSTouch) {
                    self.workTSTouch();
                }
            }
            break;
        case 11:
        {
            if (self.fqpTSTouch) {
                self.fqpTSTouch();
            }
        }
            break;
        case 12:
        {
            if (self.xslTSTouch) {
                self.xslTSTouch();
            }
        }
            break;
        case 13:
        {
            if (self.dbhTSTouch) {
                self.dbhTSTouch();
            }
        }
            break;
        default:
            break;
    }
}

@end
