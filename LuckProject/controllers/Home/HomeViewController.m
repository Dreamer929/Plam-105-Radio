//
//  HomeViewController.m
//  LuckProject
//
//  Created by moxi on 2017/6/25.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "HomeViewController.h"

#import "HomeDetialViewController.h"
#import "HomeMoreViewController.h"
#import "HomeSecondViewController.h"

#import "ECScrollView.h"
#import "HomeCategoryView.h"
#import "HomeTuijianView.h"
#import "BookTuijianView.h"
#import "ChildWordView.h"
#import "HealthView.h"
#import "TalkShowView.h"
#import "HomeFMView.h"
#import "MusicPlayerMainView.h"

@interface HomeViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *baseScrollview;
@property (nonatomic, strong)ECScrollView *guideScrollview;

@property (nonatomic, strong)HomeCategoryView *homeCategory;
@property (nonatomic, strong)HomeTuijianView *homeTuijianView;
@property (nonatomic, strong)BookTuijianView *bookTuijianView;
@property (nonatomic, strong)ChildWordView *childWorldView;
@property (nonatomic, strong)HealthView *healthView;
@property (nonatomic, strong)TalkShowView *talkShowView;
@property (nonatomic, strong)HomeFMView *homeFmView;

@property (nonatomic, strong)MusicPlayerMainView *mainView;


@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
    
    self.mainView = [[MusicPlayerMainView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.mainView];
    [[[UIApplication sharedApplication] keyWindow] addSubview:self.mainView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UI

-(void)createUI{
    
    CGFloat topHeight;
    CGFloat version = [[[UIDevice currentDevice]systemVersion] floatValue];
    if (version >= 11.0) {
        CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];
        CGRect NavRect = self.navigationController.navigationBar.frame;
        topHeight = StatusRect.size.height + NavRect.size.height;
    }else{
        topHeight = 64;
    }
    self.baseScrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, topHeight, DREAMCSCREEN_W, DREAMCSCREEN_H - 49)];
    self.baseScrollview.backgroundColor = ECCOLOR(245, 245, 245, 1);
    self.baseScrollview.showsVerticalScrollIndicator = NO;
    self.baseScrollview.showsHorizontalScrollIndicator = NO;
    self.baseScrollview.bounces = YES;
    self.baseScrollview.contentSize = CGSizeMake(DREAMCSCREEN_W, 980 + 760 + 220);
    [self.view addSubview:self.baseScrollview];
    
    UILabel *flagLable = [[UILabel alloc]initWithFrame:CGRectMake(0, 980+760+140, DREAMCSCREEN_W, 35)];
    flagLable.text = @"- - - - -我是有底线的- - - - -";
    flagLable.textColor = [UIColor grayColor];
    flagLable.textAlignment = NSTextAlignmentCenter;
    flagLable.font = [UIFont systemFontOfSize:16];
    [self.baseScrollview addSubview:flagLable];
    
    HomeDetialViewController *homeDetialVC = [[HomeDetialViewController alloc]init];
    
    self.guideScrollview = [[ECScrollView alloc]initWithFrame:CGRectMake(0, 0, DREAMCSCREEN_W, 190) imageURLs:IMGURLS callBack:^(NSInteger index) {
        
        switch (index) {
            case 0:
            {
                homeDetialVC.guideindex = index;
            }
                break;
            case 1:
            {
                homeDetialVC.guideindex = index;
            }
                break;
            case 2:
            {
                homeDetialVC.guideindex = index;
            }
                break;
            case 3:
            {
                
                homeDetialVC.guideindex = index;
            }
                break;
            default:
                break;
        }
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
        
    }];
    
    [self.baseScrollview addSubview:self.guideScrollview];
    
    HomeSecondViewController *homeSecondVc = [[HomeSecondViewController alloc]init];
    self.homeCategory = [[HomeCategoryView alloc]init];
    [self.homeCategory showInview:self.baseScrollview childBlock:^{
        
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = 4;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } schollBlock:^{
        
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = 5;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } bookBlock:^{
        
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = 6;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } historyBlock:^{
        
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = 7;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    
    
    self.homeTuijianView = [[HomeTuijianView alloc]init];
    [self.homeTuijianView showInview:self.baseScrollview pomeClick:^{
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = 8;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } FMClick:^{
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = 9;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    

    HomeMoreViewController *homeMoreVC = [[HomeMoreViewController alloc]init];
    self.bookTuijianView = [[BookTuijianView alloc]init];
    [self.bookTuijianView showInView:self.baseScrollview lhzClick:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeTuijianFirst;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } lybClick:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeTuijianSeconed;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } wLClick:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeTuijianThird;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } mCSClick:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeYTuijianFouth;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } moreClick:^{
        self.hidesBottomBarWhenPushed = YES;
        homeMoreVC.titleDatas = @[@"小说"];
        [self.navigationController pushViewController:homeMoreVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    
    self.childWorldView = [[ChildWordView alloc]init];
    [self.childWorldView showInView:self.baseScrollview aTusheng:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeChildGeLin;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } sleep:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeChildSleep;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } gongzhu:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeChildGongzhu;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } years:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HOmeChildYears;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } more:^{
        self.hidesBottomBarWhenPushed = YES;
        homeMoreVC.titleDatas = @[@"儿童"];
        [self.navigationController pushViewController:homeMoreVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    
    self.healthView = [[HealthView alloc]init];
    [self.healthView showInView:self.baseScrollview yangSheng:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeHealthFirst;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } jianfei:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeHealthSecond;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } mingYi:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeHealthThird;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } zhengJiu:^{
        self.hidesBottomBarWhenPushed = YES;
        homeSecondVc.tuijian = HomeHealthFourth;
        [self.navigationController pushViewController:homeSecondVc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } more:^{
        self.hidesBottomBarWhenPushed = YES;
        homeMoreVC.titleDatas = @[@"养生"];
        [self.navigationController pushViewController:homeMoreVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    
    
    self.talkShowView = [[TalkShowView alloc]init];
    [self.talkShowView showInView:self.baseScrollview work:^{
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = HomeTalkShowFirst;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } fqp:^{
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = HomeTaskShowSecond;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } xsl:^{
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = HomeTaskShowThird;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } dbh:^{
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = HomeTaskShowFourth;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } more:^{
        self.hidesBottomBarWhenPushed = YES;
        homeMoreVC.titleDatas = @[@"脱口秀"];
        [self.navigationController pushViewController:homeMoreVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    
    self.homeFmView = [[HomeFMView alloc]init];
    [self.homeFmView showInView:self.baseScrollview chengyi:^{
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = HomeFMFirst;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } sleep:^{
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = HomeFMSecond;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } fengshui:^{
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = HomeFMThitd;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    } cu:^{
        self.hidesBottomBarWhenPushed = YES;
        homeDetialVC.guideindex = HomeFMFourth;
        [self.navigationController pushViewController:homeDetialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];

    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 32, 32);
    [rightBtn setImage:ECIMAGENAME(@"musicFlag") forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(popPlayerClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = item;
}

-(void)popPlayerClick:(UIButton*)button{
    
    MusicPlayerViewController *vc = [MusicPlayerViewController sharedInstance];
    [self presentViewController:vc animated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
