//
//  HomeDetialViewController.m
//  LuckProject
//
//  Created by moxi on 2017/10/27.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "HomeDetialViewController.h"

#import "DetialTableViewCell.h"
#import "DetialModel.h"

@interface HomeDetialViewController ()

@property (nonatomic, assign)NSInteger page;

@property (nonatomic, strong)NSMutableArray *dataSouce;


@end

@implementation HomeDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self createUI];
    self.dataSouce = [NSMutableArray array];
    self.page = 1;
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UI

-(void)createUI{
    
    switch (self.guideindex) {
        case HomeGuideSanwen:
            {
                self.navigationItem.title = @"美到心碎的散文";
            }
            break;
        case HomeGuideSound:
        {
            self.navigationItem.title = @"电音大全";
        }
            break;
        case HomeGuideGuitar:
        {
            self.navigationItem.title = @"经典古典吉他";
        }
            break;
        case HomeGuideGushiHui:
        {
            self.navigationItem.title = @"故事汇";
        }
            break;
        case HomeSeconedChild:
        {
            self.navigationItem.title = @"新派童话";
        }
            break;
        case HomeSeconedSchool:
        {
            self.navigationItem.title = @"哈佛大学公开课";
        }
            break;
        case HomeSeconedRead:
        {
            self.navigationItem.title = @"外国短片小说";
        }
            break;
        case HomeSeconedHistory:
        {
            self.navigationItem.title = @"国学通鉴";
        }
            break;
        case HomeThirdPoem:
        {
            self.navigationItem.title = @"散落的诗歌";
        }
            break;
        case HomeThirdMusic:
        {
            self.navigationItem.title = @"轻音乐";
        }
            break;
        case HomeTalkShowFirst:
            self.navigationItem.title = @"work TS";
            break;
        case HomeTaskShowSecond:
            self.navigationItem.title = @"搞笑专辑";
            break;
        case HomeTaskShowThird:
            self.navigationItem.title = @"Task show";
            break;
        case HomeTaskShowFourth:
            self.navigationItem.title = @"东北那旮沓";
            break;
        case HomeFMFirst:
            self.navigationItem.title = @"成一";
            break;
        case HomeFMSecond:
            self.navigationItem.title = @"陪你入睡";
            break;
        case HomeFMThitd:
            self.navigationItem.title = @"风水浅谈";
            break;
        case HomeFMFourth:
            self.navigationItem.title = @"生活加点料";
            break;
        case FenleiZhiyuXiFirst:
            self.navigationItem.title = @"许莫爱音乐";
            break;
        case FenleiZhiyuXiSecond:
            self.navigationItem.title = @"净化心灵";
            break;
        case FenleiZhiyuXiThird:
            self.navigationItem.title = @"枕边音乐";
            break;
        case FenleiZhiyuxiFourth:
            self.navigationItem.title = @"夏小薇";
            break;
        case FenleiZhiyuxiFirth:
            self.navigationItem.title = @"自然力量";
            break;
        default:
            break;
    }
    CGFloat topHeight;
   
    CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];
    CGRect NavRect = self.navigationController.navigationBar.frame;
    topHeight = StatusRect.size.height + NavRect.size.height;
   
    
    [self initTableViewWithFrame:CGRectMake(0, topHeight, DREAMCSCREEN_W, DREAMCSCREEN_H) WithHeadRefresh:YES WithFootRefresh:YES WithScrollIndicator:NO];
    [self.tableView registerNib:[UINib nibWithNibName:@"DetialTableViewCell" bundle:nil] forCellReuseIdentifier:@"detial"];
    
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

#pragma mark -freshAndLoadData

-(void)fetch{
    
    self.page = 1;
    [self showBaseHud];
    
    [MoxiMusicAPI getListHomeCaregaty:self.guideindex page:self.page callBackData:^(NSMutableArray *data, NSString *error) {
        if (data) {
            [self.dataSouce removeAllObjects];
            [self.dataSouce addObjectsFromArray:data];
            [self.tableView reloadData];
            [self dismissHudWithSuccessTitle:@"" After:1.f];
        }else{
            [self dismissHudWithErrorTitle:error After:1.f];
        }
        
        [self.tableView.mj_header endRefreshing];
    }];
    
    
}

-(void)loadData{
    
    self.page++;
    [self showBaseHud];
    
    [MoxiMusicAPI getListHomeCaregaty:self.guideindex page:self.page callBackData:^(NSMutableArray *data, NSString *error) {
        if (data) {
            [self.dataSouce addObjectsFromArray:data];
            [self.tableView reloadData];
            [self dismissHudWithSuccessTitle:@"" After:1.f];
        }else{
            [self dismissHudWithErrorTitle:error After:1.f];
        }
        
        [self.tableView.mj_footer endRefreshing];
    }];
   
}

-(void)tableViewHeadRefresh{
    
    [self fetch];
}

-(void)tableViewFootRefresh{
    
    [self loadData];
}

#pragma mark -tableviewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSouce.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetialTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detial"];
    if (!cell) {
        cell = [[DetialTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"detial"];
    }
    DetialModel *model = self.dataSouce[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.headView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:ECIMAGENAME(@"cellImage")];
    cell.detialTitle.text = model.title;
    cell.timeLable.text = model.duration;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetialModel *model = self.dataSouce[indexPath.row];
    
    MusicPlayerViewController *vc = [MusicPlayerViewController sharedInstance];
    vc.modelArr = [NSMutableArray arrayWithArray:self.dataSouce];
    vc.currtenflag = indexPath.row;
    [vc playCurrtnItem:model];
    self.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController presentViewController:vc animated:YES completion:nil];
    
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
