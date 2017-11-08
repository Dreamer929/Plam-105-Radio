//
//  HomeMoreViewController.m
//  LuckProject
//
//  Created by moxi on 2017/10/27.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "HomeMoreViewController.h"

#import "DetialViewController.h"
#import "MyCollectionViewCell.h"

@interface HomeMoreViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>


@property (nonatomic, strong)UICollectionView *firstCollectionView;


@property (nonatomic, assign)NSInteger firstPage;

@property (nonatomic, strong)NSMutableArray*firstDataSource;


@end

@implementation HomeMoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
  
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self createUI];
    self.firstDataSource = [NSMutableArray array];
    [self.firstCollectionView.mj_header beginRefreshing];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.firstCollectionView removeFromSuperview];
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
    
    self.navigationItem.title = @"更多";
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 40, 40);
    [rightBtn setImage:ECIMAGENAME(@"musicFlag") forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(popPlayerClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = item;
    
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc]init];
    flowLayout1.minimumInteritemSpacing = 15;
    flowLayout1.minimumLineSpacing = 15;
    flowLayout1.itemSize = CGSizeMake(DREAMCSCREEN_W/2-30,DREAMCSCREEN_W/2 + 20);
    flowLayout1.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);
    flowLayout1.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.firstCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, topHeight, DREAMCSCREEN_W, DREAMCSCREEN_H - topHeight) collectionViewLayout:flowLayout1];
    self.firstCollectionView.backgroundColor = [UIColor whiteColor];
    self.firstCollectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(collectionHeadView)];
    self.firstCollectionView.mj_footer = [MJRefreshBackFooter footerWithRefreshingTarget:self refreshingAction:@selector(collectionFootView)];
    self.firstCollectionView.delegate = self;
    self.firstCollectionView.dataSource = self;
    [self.firstCollectionView registerNib:[UINib nibWithNibName:@"MyCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"collection"];
    [self.view addSubview:self.firstCollectionView];
    
}




#pragma mark netquest

-(void)netquest{
    self.firstPage = 1;
    NSString *keyword;
    keyword = self.titleDatas[0];
    [self showBaseHudWithTitle:@""];
    [MoxiMusicAPI getMoreListBykeyword:keyword page:self.firstPage callBack:^(NSMutableArray *data, NSString *error) {
        if (data) {
            [self.firstDataSource removeAllObjects];
            [self.firstDataSource addObjectsFromArray:data];
            [self.firstCollectionView reloadData];
            [self dismissHudWithSuccessTitle:@"" After:1.f];
        }else{
            [self dismissHudWithErrorTitle:error After:1.f];
            [self.firstCollectionView.mj_header endRefreshing];
        }
        [self.firstCollectionView.mj_header endRefreshing];
    }];
   
}

-(void)loadData{
    self.firstPage++;
    NSString *keyword;
    keyword = self.titleDatas[0];
    [self showBaseHudWithTitle:@""];
    [MoxiMusicAPI getMoreListBykeyword:keyword page:self.firstPage callBack:^(NSMutableArray *data, NSString *error) {
        if (data) {
            [self.firstDataSource addObjectsFromArray:data];
            [self.firstCollectionView reloadData];
            [self dismissHudWithSuccessTitle:@"" After:1.f];
        }else{
            [self dismissHudWithErrorTitle:error After:1.f];
            [self.firstCollectionView.mj_footer endRefreshing];
        }
        [self.firstCollectionView.mj_footer endRefreshing];
    }];
   
}


#pragma mark tabelviewDelegate


#pragma mark -collectionViewDelegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.firstDataSource.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collection" forIndexPath:indexPath];
    ListModel *model = self.firstDataSource[indexPath.row];
    [cell.headView sd_setImageWithURL:[NSURL URLWithString:model.thumb] placeholderImage:ECIMAGENAME(@"")];
    cell.cellTitle.text = model.title;
    return cell;
    
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ListModel *model = self.firstDataSource[indexPath.row];
   
    DetialViewController *vc = [[DetialViewController alloc]init];
    vc.model = model;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)collectionHeadView{
    [self netquest];
}

-(void)collectionFootView{
    [self loadData];
}

#pragma mark -click

-(void)popPlayerClick:(UIButton*)button{
   
    MusicPlayerViewController *vc = [[MusicPlayerViewController alloc]init];
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
