//
//  FenleiBaijiaView.m
//  LuckProject
//
//  Created by moxi on 2017/11/1.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "FenleiBaijiaView.h"

@interface FenleiBaijiaView ()

@property (nonatomic,strong)NSArray *images;
@property (nonatomic,strong)NSArray *titles;
@property (nonatomic, copy)NSString *titleStr;


@end

@implementation FenleiBaijiaView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame titleFlag:(NSString*)titleStr imageURLs:(NSArray *)images titles:(NSArray *)titles callBack:(void (^)(NSInteger))selectview{
    self = [super initWithFrame:frame];
    if (self) {
        self.titles = titles;
        self.images = images;
        self.titleStr = titleStr;
        self.backgroundColor = [UIColor whiteColor];
        
        [self createUI];
        
        self.viewBlock = selectview;
    }
    return self;
    
}

-(void)createUI{
    
    UILabel *lable = [[UILabel alloc]init];
    lable.text = self.titleStr;
    lable.font = [UIFont boldSystemFontOfSize:17];
    lable.textAlignment = NSTextAlignmentLeft;
    lable.textColor = [UIColor lightGrayColor];
    [self addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(0);
        make.left.mas_equalTo(self.mas_left).offset(30);
        make.right.mas_equalTo(self.mas_right);
        make.height.mas_equalTo(50);
    }];
    
    CGFloat viewPad = 2;
    CGFloat viewWith = (DREAMCSCREEN_W - 4*2)/3;
    CGFloat viewHeight = 50;
    
    CGFloat hFlag;
    if (self.images.count == 12) {
        hFlag = 4;
    }else{
        hFlag = 3;
    }
    
    
    for (NSInteger index = 0; index < self.titles.count; index++) {

        if ([self.titles[0] isEqualToString:@"阿卡贝拉"]) {
            CGFloat hpad = index/3;
            CGFloat vpad = index%3;
            UIView *baseview = [[UIView alloc]initWithFrame:CGRectMake((viewPad + viewWith)*hpad + viewPad, 50+(viewWith+viewPad)*vpad, viewWith, viewWith)];
            baseview.backgroundColor = ECCOLOR(240, 240, 240, 1);
            baseview.tag = index;
            [baseview addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)]];
            [self addSubview:baseview];
            
            
            UIImageView *img = [[UIImageView alloc]initWithImage:ECIMAGENAME(self.images[index])];
            img.userInteractionEnabled = YES;
            img.layer.cornerRadius = 35;
            img.layer.masksToBounds = YES;
            [baseview addSubview:img];
            [img mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(baseview.mas_centerX);
                make.top.mas_equalTo(baseview.mas_top).offset(15);
                make.height.mas_equalTo(70);
                make.width.mas_equalTo(70);
            }];
            
            UILabel *lable = [[UILabel alloc]init];
            lable.text = self.titles[index];
            lable.font = [UIFont systemFontOfSize:16];
            lable.textAlignment = NSTextAlignmentCenter;
            [baseview addSubview:lable];
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(img.mas_bottom);
                make.left.mas_equalTo(baseview.mas_left);
                make.bottom.mas_equalTo(baseview.mas_bottom);
                make.right.mas_equalTo(baseview.mas_right);
            }];
           
        }
        
        if ([self.titles[0]isEqualToString:@"钢琴"]) {
            
            CGFloat hpad = index/4;
            CGFloat vpad = index%4;
            UIView *baseview = [[UIView alloc]initWithFrame:CGRectMake((viewPad + viewWith)*hpad + viewPad, 50+(viewHeight+viewPad)*vpad, viewWith, viewHeight)];
            baseview.backgroundColor = ECCOLOR(240, 240, 240, 1);
            baseview.tag = index;
            [baseview addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)]];
            [self addSubview:baseview];
            
            UIImageView *img = [[UIImageView alloc]initWithImage:ECIMAGENAME(self.images[index])];
            img.userInteractionEnabled = YES;
            [baseview addSubview:img];
            [img mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(baseview.mas_centerY);
                make.left.mas_equalTo(baseview.mas_left).offset(15);
                make.height.mas_equalTo(32);
                make.width.mas_equalTo(32);
            }];
            
            UILabel *lable = [[UILabel alloc]init];
            lable.text = self.titles[index];
            lable.font = [UIFont systemFontOfSize:16];
            lable.textColor = ECCOLOR(arc4random()%255, arc4random()%255, arc4random()%255, 1);
            lable.textAlignment = NSTextAlignmentLeft;
            [baseview addSubview:lable];
            [lable mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.mas_equalTo(baseview.mas_centerY);
                make.left.mas_equalTo(img.mas_right).offset(5);
                make.height.mas_equalTo(50);
                make.right.mas_equalTo(baseview.mas_right);
            }];
        }
        
        if ([self.titles[0]isEqualToString:@"黄梅戏"]) {
            CGFloat hpad;
            CGFloat vpad;
            CGFloat r = arc4random()%255;
            CGFloat g = arc4random()%255;
            CGFloat b = arc4random()%255;
            hpad = index/2;
            vpad = index%2;
            UIView *baseview = [[UIView alloc]initWithFrame:CGRectMake((viewPad + viewWith)*hpad + viewPad, 50+(viewHeight+viewPad)*vpad, viewWith, viewHeight)];
            baseview.backgroundColor = ECCOLOR(240, 240, 240, 1);
            baseview.tag = index;
            [baseview addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)]];
            [self addSubview:baseview];
            UILabel *lable = [[UILabel alloc]initWithFrame:baseview.bounds];
            lable.text = self.titles[index];
            if (self.titles.count == 6) {
                lable.textColor = ECCOLOR(r, g, b, 1);
            }
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font = [UIFont systemFontOfSize:19];
            [baseview addSubview:lable];
            

        }
        
        if ([self.titles[0]isEqualToString:@"易中天"]) {
            CGFloat hpad;
            CGFloat vpad;
            hpad = index/3;
            vpad = index%3;
            UIView *baseview = [[UIView alloc]initWithFrame:CGRectMake((viewPad + viewWith)*hpad + viewPad, 50+(viewHeight+viewPad)*vpad, viewWith, viewHeight)];
            baseview.backgroundColor = ECCOLOR(240, 240, 240, 1);
            baseview.tag = index;
            [baseview addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click:)]];
            [self addSubview:baseview];
            UILabel *lable = [[UILabel alloc]initWithFrame:baseview.bounds];
            lable.text = self.titles[index];
            lable.textAlignment = NSTextAlignmentCenter;
            lable.font = [UIFont systemFontOfSize:19];
            [baseview addSubview:lable];
            
        }
        
    }

}

-(void)click:(UITapGestureRecognizer*)tap{
    
    NSInteger Index = tap.view.tag;
    
    if (self.viewBlock) {
        self.viewBlock(Index);
    }
}

@end
