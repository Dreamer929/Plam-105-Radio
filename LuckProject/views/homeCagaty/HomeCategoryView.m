//
//  HomeCategoryView.m
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "HomeCategoryView.h"

@interface HomeCategoryView ()

@property (nonatomic, strong) UIView    *childView;
@property (nonatomic, strong) UIView    *schollView;
@property (nonatomic, strong) UIView    *bookView;
@property (nonatomic, strong) UIView    *historyView;

@end

@implementation HomeCategoryView

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
        self.frame = CGRectMake(0, 190, DREAMCSCREEN_W, 80);
        [self setUpView];
    }
    return self;
}

-(void)setUpView{
   
    CGFloat viewWidth = DREAMCSCREEN_W/4;
    CGFloat viewHeight = 80;
    
    self.childView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, viewWidth, viewHeight)];
    self.childView.backgroundColor = [UIColor whiteColor];
    [self.childView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(childClick:)]];
    [self addSubview:self.childView];
    
    UIImageView *childImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"child")];
    childImg.userInteractionEnabled = YES;
    [self.childView addSubview:childImg];
    [childImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.childView);
        make.top.mas_equalTo(self.childView).offset(8);
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(42);
    }];
    UILabel *childLable = [[UILabel alloc]init];
    childLable.text = @"儿童";
    childLable.font = [UIFont systemFontOfSize:17];
    childLable.textAlignment = NSTextAlignmentCenter;
    [self.childView addSubview:childLable];
    [childLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(childImg.mas_bottom).offset(5);
        make.left.mas_equalTo(self.childView.mas_left);
        make.right.mas_equalTo(self.childView.mas_right);
        make.bottom.mas_equalTo(self.childView.mas_bottom).offset(-8);
    }];
    
    self.schollView = [[UIView alloc]initWithFrame:CGRectMake(viewWidth, 0, viewWidth, viewHeight)];
    self.schollView.backgroundColor = [UIColor whiteColor];
    [self.schollView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(schollClick:)]];
    [self addSubview:self.schollView];
    UIImageView *schollImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"xiqu")];
    schollImg.userInteractionEnabled = YES;
    [self.schollView addSubview:schollImg];
    [schollImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.schollView);
        make.top.mas_equalTo(self.schollView).offset(8);
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(42);
    }];
    UILabel *schollLable = [[UILabel alloc]init];
    schollLable.text = @"公开课";
    schollLable.font = [UIFont systemFontOfSize:17];
    schollLable.textAlignment = NSTextAlignmentCenter;
    [self.schollView addSubview:schollLable];
    [schollLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(schollImg.mas_bottom).offset(5);
        make.left.mas_equalTo(self.schollView.mas_left);
        make.right.mas_equalTo(self.schollView.mas_right);
        make.bottom.mas_equalTo(self.schollView.mas_bottom).offset(-8);
    }];
    
    
    self.bookView = [[UIView alloc]initWithFrame:CGRectMake(viewWidth*2, 0, viewWidth, viewHeight)];
    self.bookView.backgroundColor = [UIColor whiteColor];
    [self.bookView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bookClick:)]];
    [self addSubview:self.bookView];
    UIImageView *bookImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"book")];
    bookImg.userInteractionEnabled = YES;
    [self.bookView addSubview:bookImg];
    [bookImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.bookView);
        make.top.mas_equalTo(self.bookView).offset(8);
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(42);
    }];
    UILabel *bookLable = [[UILabel alloc]init];
    bookLable.text = @"读书";
    bookLable.font = [UIFont systemFontOfSize:17];
    bookLable.textAlignment = NSTextAlignmentCenter;
    [self.bookView addSubview:bookLable];
    [bookLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(bookImg.mas_bottom).offset(5);
        make.left.mas_equalTo(self.bookView.mas_left);
        make.right.mas_equalTo(self.bookView.mas_right);
        make.bottom.mas_equalTo(self.bookView.mas_bottom).offset(-8);
    }];
    
    
    self.historyView = [[UIView alloc]initWithFrame:CGRectMake(viewWidth*3, 0, viewWidth, viewHeight)];
    self.historyView.backgroundColor = [UIColor whiteColor];
    [self.historyView addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(historyClick:)]];
    [self addSubview:self.historyView];
    UIImageView *historyImg = [[UIImageView alloc]initWithImage:ECIMAGENAME(@"history")];
    historyImg.userInteractionEnabled = YES;
    [self.historyView addSubview:historyImg];
    [historyImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.historyView);
        make.top.mas_equalTo(self.historyView).offset(8);
        make.width.mas_equalTo(42);
        make.height.mas_equalTo(42);
    }];
    UILabel *historyLable = [[UILabel alloc]init];
    historyLable.text = @"历史人文";
    historyLable.font = [UIFont systemFontOfSize:17];
    historyLable.textAlignment = NSTextAlignmentCenter;
    [self.historyView addSubview:historyLable];
    [historyLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(historyImg.mas_bottom).offset(5);
        make.left.mas_equalTo(self.historyView.mas_left);
        make.right.mas_equalTo(self.historyView.mas_right);
        make.bottom.mas_equalTo(self.historyView.mas_bottom).offset(-8);
    }];
    
}


-(void)showInview:(UIView *)hostView childBlock:(void (^)())childTouch schollBlock:(void (^)())schollTouch bookBlock:(void (^)())bookTouch historyBlock:(void (^)())historyTouch{
    [hostView addSubview:self];
    self.onHomeChildClick = childTouch;
    self.onHomeSchollClick = schollTouch;
    self.onHomeBookClick = bookTouch;
    self.onHomeHistoyrClick = historyTouch;
    
}

#pragma mark -tapAction

-(void)childClick:(UITapGestureRecognizer*)sender{
    if (self.onHomeChildClick) {
        self.onHomeChildClick();
    }
}

-(void)schollClick:(UITapGestureRecognizer*)sender{
    if (self.onHomeSchollClick) {
        self.onHomeSchollClick();
    }
}

-(void)bookClick:(UITapGestureRecognizer*)sender{
    if (self.onHomeBookClick) {
        self.onHomeBookClick();
    }
}

-(void)historyClick:(UITapGestureRecognizer*)sender{
    if (self.onHomeHistoyrClick) {
        self.onHomeHistoyrClick();
    }
    
}

@end
