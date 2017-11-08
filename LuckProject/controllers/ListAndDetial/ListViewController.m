//
//  ListViewController.m
//  LuckProject
//
//  Created by moxi on 2017/10/30.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "ListViewController.h"

#import "ListViewTableViewCell.h"
#import "DetialViewController.h"

@interface ListViewController ()

@property (nonatomic, strong)NSMutableArray *dataSouce;
@property (nonatomic, assign)NSInteger page;

@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = self.myTitle;
    [self createUI];
    self.dataSouce = [NSMutableArray array];
    [self.tableView.mj_header beginRefreshing];
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
    [self initTableViewWithFrame:CGRectMake(0, topHeight, DREAMCSCREEN_W, DREAMCSCREEN_H ) WithHeadRefresh:YES WithFootRefresh:YES WithScrollIndicator:NO];
    [self.tableView registerNib:[UINib nibWithNibName:@"ListViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"listcell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
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

#pragma mark -tableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSouce.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 120;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ListViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listcell"];
    if (!cell) {
        cell = [[ListViewTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"listcell"];
    }
    ListModel *model = self.dataSouce[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell.headView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:ECIMAGENAME(@"cellImage")];
    cell.listTitle.text = model.intro;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DetialViewController *detialVC = [[DetialViewController alloc]init];
    self.hidesBottomBarWhenPushed = YES;
    ListModel *model = self.dataSouce[indexPath.row];
    detialVC.model = model;
    [self.navigationController pushViewController:detialVC animated:YES];
}

-(void)tableViewHeadRefresh{
    [self showBaseHudWithTitle:@""];
    self.page = 1;
    [MoxiMusicAPI getSearchByKeyWord:self.myTitle page:self.page callBlock:^(NSMutableArray *data, NSString *error) {
        if (data) {
            [self.dataSouce removeAllObjects];
            [self.dataSouce addObjectsFromArray:data];
            [self dismissHudWithSuccessTitle:@"" After:1.f];
        }else{
            [self dismissHudWithErrorTitle:error After:1.f];
        }
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
    
}

-(void)tableViewFootRefresh{
    [self showBaseHudWithTitle:@""];
    self.page++;
    [MoxiMusicAPI getSearchByKeyWord:self.myTitle page:self.page callBlock:^(NSMutableArray *data, NSString *error) {
        if (data) {
            [self.dataSouce addObjectsFromArray:data];
            [self dismissHudWithSuccessTitle:@"" After:1.f];
        }else{
            [self dismissHudWithErrorTitle:error After:1.f];
        }
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
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
