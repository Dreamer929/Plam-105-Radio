//
//  DetialViewController.m
//  LuckProject
//
//  Created by moxi on 2017/10/30.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "DetialViewController.h"
#import "DetialTableViewCell.h"

#import "DetialModel.h"

@interface DetialViewController ()
@property (nonatomic, assign)NSInteger page;

@property (nonatomic, strong)NSMutableArray *dataSouce;
@end

@implementation DetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = self.model.title;
    [self createUI];
    
    
    self.dataSouce = [NSMutableArray array];
    self.page = 1;
    
    [self.tableView.mj_header beginRefreshing];
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
        self.automaticallyAdjustsScrollViewInsets = YES;
    }else{
        topHeight = 64;
    }
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

#pragma mark -fetch

#pragma mark -freshAndLoadData

-(void)fetch{
    
    self.page = 1;
    [self showBaseHud];
    [MoxiMusicAPI getShiCiDetialListByModel:self.model page:self.page callBlack:^(NSMutableArray *data, NSString *error) {
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
    [self showBaseHudWithTitle:@""];
    [MoxiMusicAPI getShiCiDetialListByModel:self.model page:self.page callBlack:^(NSMutableArray *data, NSString *error) {
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


#pragma mark -UI

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataSouce.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     DetialTableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:@"detial"];
    if (!cell) {
        cell = [[DetialTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"detial"];
    }
    DetialModel *model = self.dataSouce[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.headView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:nil];
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
