//
//  FeileiViewController.m
//  LuckProject
//
//  Created by moxi on 2017/10/25.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "FeileiViewController.h"

#import "ListViewController.h"
#import "HomeDetialViewController.h"

#import "FenleiBaijiaView.h"
#import "ECScrollView.h"

@interface FeileiViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *baseScrollview;

@property (nonatomic, strong)FenleiBaijiaView *baijiaView;
@property (nonatomic, strong)FenleiBaijiaView *musicView;
@property (nonatomic, strong)FenleiBaijiaView *xiquView;
@property (nonatomic, strong)FenleiBaijiaView *otherView;

@property (nonatomic, strong)ECScrollView *myScrollview;

@end

@implementation FeileiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UI

-(void)createUI{
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    CGFloat topHeight;
    CGFloat version = [[[UIDevice currentDevice]systemVersion] floatValue];
    if (version >= 11.0) {
        CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];
        CGRect NavRect = self.navigationController.navigationBar.frame;
        topHeight = StatusRect.size.height + NavRect.size.height;
    }else{
        topHeight = 64;
    }
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 32, 32);
    [rightBtn setImage:ECIMAGENAME(@"musicFlag") forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(popPlayerClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = item;
    
    self.baseScrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, topHeight, DREAMCSCREEN_W, DREAMCSCREEN_H - topHeight)];
    self.baseScrollview.backgroundColor = [UIColor whiteColor];
    self.baseScrollview.contentSize = CGSizeMake(DREAMCSCREEN_W, 626 + 230 +(DREAMCSCREEN_W - 4)/3*3);
    self.baseScrollview.bounces = YES;
    self.baseScrollview.showsVerticalScrollIndicator = NO;
    self.baseScrollview.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.baseScrollview];
    
    NSArray *baiJiaArrs = @[@"易中天",@"纪连海",@"于丹",@"王立群",@"袁腾飞",@"刘心武",@"钱文忠",@"孔庆东",@"康震"];
    NSArray *musicArrs = @[@"钢琴",@"古筝",@"唢呐",@"二胡",@"小提琴",@"吉他",@"葫芦丝",@"小号",@"鼓",@"琵琶",@"摇滚",@"爵士"];
    NSArray *musicImgs = @[@"gangqin",@"guzheng",@"suona",@"erhu",@"xiaotiqin",@"jita",@"hulusi",@"xiaohao",@"gu",@"pipa",@"rock",@"jueshi"];
    NSArray *xiquTitles = @[@"黄梅戏",@"越调",@"京剧",@"昆曲",@"豫剧",@"河北梆子"];
    
    NSArray *otherTitles = @[@"阿卡贝拉",@"评书",@"交响乐",@"笑话",@"相声",@"二人转",@"胎教",@"育儿",@"音乐"];
    NSArray *otherImgs = @[@"akbl",@"ps",@"jxy",@"xh",@"xs",@"erz",@"qinggan",@"yuer",@"yinyue"];
    
    UILabel *lable = [[UILabel alloc]init];
    lable.font = [UIFont boldSystemFontOfSize:17];
    lable.textAlignment = NSTextAlignmentLeft;
    lable.text = @"治愈系列";
    lable.textColor = [UIColor lightGrayColor];
    [self.baseScrollview addSubview:lable];
    
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.baseScrollview);
        make.left.mas_equalTo(self.baseScrollview.mas_left).offset(30);
        make.width.mas_equalTo(DREAMCSCREEN_W -30);
        make.height.mas_equalTo(50);
    }];
    
    
    self.myScrollview  = [[ECScrollView alloc]initWithFrame:CGRectMake(0, 50, DREAMCSCREEN_W, 120) imageURLs:ZYXIMGS callBack:^(NSInteger index) {
        HomeDetialViewController *detialVC = [[HomeDetialViewController alloc]init];
        detialVC.guideindex = index + 18;
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:detialVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    [self.baseScrollview addSubview:self.myScrollview];
    
    self.xiquView = [[FenleiBaijiaView alloc]initWithFrame:CGRectMake(0, 170, DREAMCSCREEN_W, 156) titleFlag:@"曲艺天地" imageURLs:@[] titles:xiquTitles callBack:^(NSInteger index) {
        ListViewController *listVC = [[ListViewController alloc]init];
        listVC.myTitle = xiquTitles[index];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:listVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    [self.baseScrollview addSubview:self.xiquView];
    
    
    
    self.musicView = [[FenleiBaijiaView alloc]initWithFrame:CGRectMake(0, 326, DREAMCSCREEN_W, 256) titleFlag:@"音乐乐器" imageURLs:musicImgs titles:musicArrs callBack:^(NSInteger index) {
        
        ListViewController *listVC = [[ListViewController alloc]init];
        listVC.myTitle = musicArrs[index];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:listVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    [self.baseScrollview addSubview:self.musicView];
    
    self.baijiaView = [[FenleiBaijiaView alloc]initWithFrame:CGRectMake(0,582, DREAMCSCREEN_W, 210) titleFlag:@"百家讲坛" imageURLs:@[] titles:baiJiaArrs callBack:^(NSInteger index) {
        
        ListViewController *listVC = [[ListViewController alloc]init];
        listVC.myTitle = baiJiaArrs[index];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:listVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
        
    }];
    [self.baseScrollview addSubview:self.baijiaView];
    
    self.otherView = [[FenleiBaijiaView alloc]initWithFrame:CGRectMake(0, 790, DREAMCSCREEN_W, 60 + (DREAMCSCREEN_W - 4)/3*3) titleFlag:@"其他分类" imageURLs:otherImgs titles:otherTitles callBack:^(NSInteger index) {
        ListViewController *listVC = [[ListViewController alloc]init];
        listVC.myTitle = otherTitles[index];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:listVC animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }];
    [self.baseScrollview addSubview:self.otherView];
    
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
