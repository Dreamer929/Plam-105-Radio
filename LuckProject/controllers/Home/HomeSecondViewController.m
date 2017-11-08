//
//  HomeSecondViewController.m
//  LuckProject
//
//  Created by moxi on 2017/10/30.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "HomeSecondViewController.h"
#import "LeftTableViewCell.h"
#import "RightTableViewCell.h"

@interface HomeSecondViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic, strong)UITableView *leftTableview;
@property (nonatomic, strong)UITableView *rightTableview;
@property (nonatomic, strong)NSMutableArray *leftData;
@property (nonatomic, strong)NSMutableArray *rightData;

@property (nonatomic,assign)NSInteger leftPage;
@property (nonatomic, assign)NSInteger rightPage;
@property (nonatomic, strong)ListModel *listlModel;

@end

@implementation HomeSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
}

-(void)viewWillAppear:(BOOL)animated{
    
    self.leftData = [NSMutableArray array];
    self.rightData = [NSMutableArray array];
    self.leftPage = 1;
    self.rightPage = 1;
    
    [self createUI];
    [self.leftTableview.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UI

-(void)createUI{
    
    
        CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];
        CGRect NavRect = self.navigationController.navigationBar.frame;
       CGFloat topHeight = StatusRect.size.height + NavRect.size.height;
    
    switch (self.tuijian) {
        case HomeTuijianFirst:
            self.navigationItem.title = @"李鸿章传";
            break;
        case HomeTuijianSeconed:
            self.navigationItem.title = @"琅琊榜";
            break;
        case HomeTuijianThird:
            self.navigationItem.title = @"万历十五年";
            break;
        case HomeYTuijianFouth:
            self.navigationItem.title = @"明朝那些事";
            break;
        case HomeChildGeLin:
            self.navigationItem.title = @"格林童话";
            break;
        case HomeChildSleep:
            self.navigationItem.title = @"睡前故事";
            break;
        case HomeChildGongzhu:
            self.navigationItem.title = @"公主密语";
            break;
        case HOmeChildYears:
            self.navigationItem.title = @"天天童话";
            break;
        case HomeHealthFirst:
            self.navigationItem.title = @"养生正道";
            break;
        case HomeHealthSecond:
            self.navigationItem.title = @"减肥攻略";
            break;
        case HomeHealthThird:
            self.navigationItem.title = @"中医在线";
            break;
        case HomeHealthFourth:
            self.navigationItem.title = @"针灸二三事";
            break;
        default:
            break;
    }
    
    self.leftTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, topHeight, 140, DREAMCSCREEN_H) style:UITableViewStylePlain];
    self.leftTableview.delegate = self;
    self.leftTableview.dataSource = self;
    [self.leftTableview registerNib:[UINib nibWithNibName:@"LeftTableViewCell" bundle:nil] forCellReuseIdentifier:@"leftcell"];
    self.leftTableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(leftHeadFresh)];
    self.leftTableview.mj_footer.backgroundColor = [UIColor  clearColor];
    self.leftTableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(leftFootLoad)];
    
    
    self.rightTableview = [[UITableView alloc]initWithFrame:CGRectMake(140, topHeight, DREAMCSCREEN_W - 140, DREAMCSCREEN_H) style:UITableViewStylePlain];
    self.rightTableview.delegate   = self;
    self.rightTableview.dataSource = self;
    [self.rightTableview registerNib:[UINib nibWithNibName:@"RightTableViewCell" bundle:nil] forCellReuseIdentifier:@"rightcell"];
    self.rightTableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(rightHeadFresh)];
    self.rightTableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(rightFootFresh)];
    
    if (@available(iOS 11.0, *)) {
        self.leftTableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
        self.rightTableview.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentAlways;
    }else{
        self.automaticallyAdjustsScrollViewInsets = YES;
    }
    
    [self.view addSubview:self.leftTableview];
    [self.view addSubview:self.rightTableview];
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

#pragma mark -tableview

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == self.leftTableview) {
        return self.leftData.count;
    }else{
        return self.rightData.count;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableview) {
        LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftcell"];
        if (!cell) {
            cell = [[LeftTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"leftcell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleGray;
        ListModel *list = self.leftData[indexPath.row];
        cell.LeftTitle.text = list.title;
        [cell.headView sd_setImageWithURL:[NSURL URLWithString:list.thumb] placeholderImage:ECIMAGENAME(@"")];
        return cell;
    }else{
        
        RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"rightcell"];
        if (!cell) {
            cell = [[RightTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"rightcell"];
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        DetialModel *detial = self.rightData[indexPath.row];
        cell.rightTitle.text = detial.title;
        cell.timeLable.text = detial.duration;
        return cell;
    }
   
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == self.leftTableview) {
        self.listlModel = self.leftData[indexPath.row];
        [self.rightTableview.mj_header beginRefreshing];
    }else{
        DetialModel *model = self.rightData[indexPath.row];
        
        MusicPlayerViewController *vc = [MusicPlayerViewController sharedInstance];
        vc.modelArr = [NSMutableArray arrayWithArray:self.rightData];
        vc.currtenflag = indexPath.row;
        [vc playCurrtnItem:model];
        
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    }
    
}

-(void)leftHeadFresh{
    self.leftPage = 1;
    [self showBaseHudWithTitle:@""];
    [MoxiMusicAPI getHomeSeconed:self.tuijian page:self.leftPage callBackData:^(NSMutableArray *data, NSString *error) {
        
        if (data) {
            [self.leftData removeAllObjects];
            [self.leftData addObjectsFromArray:data];
            [self.leftTableview reloadData];
            self.listlModel = self.leftData[0];
            [self.rightTableview.mj_header beginRefreshing];
            [self dismissHudWithSuccessTitle:@"" After:1.f];
        }else{
            [self dismissHudWithErrorTitle:error After:1.f];
        }
        [self.leftTableview.mj_header endRefreshing];
    }];
}

-(void)leftFootLoad{
    self.leftPage++;
    [self showBaseHudWithTitle:@""];
    [MoxiMusicAPI getHomeSeconed:self.tuijian page:self.leftPage callBackData:^(NSMutableArray *data, NSString *error) {
        
        if (data) {
            [self.leftData addObjectsFromArray:data];
            [self.leftTableview reloadData];
            [self dismissHudWithSuccessTitle:@"" After:1.f];
        }else{
            [self dismissHudWithErrorTitle:error After:1.f];
        }
        [self.leftTableview.mj_footer endRefreshing];
    }];
}

-(void)rightHeadFresh{

    self.rightPage = 1;
    [self showBaseHudWithTitle:@""];
    [MoxiMusicAPI getShiCiDetialListByModel:self.listlModel page:self.rightPage callBlack:^(NSMutableArray *data, NSString *error) {
        
        if (data) {
            [self.rightData removeAllObjects];
            [self.rightData addObjectsFromArray:data];
            [self.rightTableview reloadData];
            [self dismissHudWithSuccessTitle:@"" After:1.f];
        }else{
            [self dismissHudWithErrorTitle:error After:1.f];
        }
        [self.rightTableview.mj_header endRefreshing];
    }];
}

-(void)rightFootFresh{
    
    self.rightPage++;
    [self showBaseHudWithTitle:@""];
    [MoxiMusicAPI getShiCiDetialListByModel:self.listlModel page:self.rightPage callBlack:^(NSMutableArray *data, NSString *error) {
        if (data) {
            [self.rightData addObjectsFromArray:data];
            [self.rightTableview reloadData];
            [self dismissHudWithSuccessTitle:@"" After:1.f];
        }else{
            [self dismissHudWithErrorTitle:error After:1.f];
        }
        [self.rightTableview.mj_footer endRefreshing];
    }];
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
