//
//  SearchViewController.m
//  LuckProject
//
//  Created by moxi on 2017/10/25.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "SearchViewController.h"

#import "ListViewController.h"
#import "HistoryCollectionViewCell.h"

#import "MoxiConfig.h"

@interface SearchViewController ()<UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UISearchBar *mySearch;

@property (nonatomic, strong)NSArray *dataSouce;

@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataSouce = [NSArray array];
    [self createUI];
    [self.collectionView.mj_header beginRefreshing];
}

-(void)viewWillAppear:(BOOL)animated{
    
    [self.collectionView reloadData];
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
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 32, 32);
    [rightBtn setImage:ECIMAGENAME(@"musicFlag") forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(popPlayerClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = item;
    
    self.navigationItem.title = @"搜索";
 
    self.mySearch = [[UISearchBar alloc]init];
    self.mySearch.placeholder = @"试试搜搜";
    self.mySearch.delegate = self;
    self.mySearch.barTintColor = ECCOLOR(230, 230, 230, 1);
    [self.view addSubview:self.mySearch];
    
    [self.mySearch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.height.mas_equalTo(35);
        make.top.mas_equalTo(self.view.mas_top).offset(topHeight);
    }];
    
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"搜索历史";
    lable.textColor = ECCOLOR(220, 220, 220, 1);
    lable.textAlignment = NSTextAlignmentCenter;
    lable.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:lable];
    
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left);
        make.right.mas_equalTo(self.view.mas_right);
        make.top.mas_equalTo(self.mySearch.mas_bottom).offset(10);
        make.height.mas_equalTo(30);
    }];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.minimumInteritemSpacing = 0;
    flowLayout.minimumLineSpacing = 0;
    flowLayout.itemSize = CGSizeMake(DREAMCSCREEN_W/3,40);
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, topHeight + 35 +60, DREAMCSCREEN_W, DREAMCSCREEN_H - topHeight - 35 - 60 - 70) collectionViewLayout:flowLayout];
    
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"HistoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"history"];
    
    [self.view addSubview:self.collectionView];
}

#pragma mark -click

-(void)popPlayerClick:(UIButton*)button{
    
    MusicPlayerViewController *vc = [MusicPlayerViewController sharedInstance];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark -delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    MoxiConfig *config = [MoxiConfig shareInstance];
    if (config.history) {
        NSMutableString *string = [NSMutableString stringWithString:config.history];
        self.dataSouce = [string componentsSeparatedByString:@","];
        return  self.dataSouce.count + 1;
    }
    return 0;
    
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HistoryCollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"history" forIndexPath:indexPath];
    if (indexPath.row == self.dataSouce.count) {
        cell.historyLable.text = @"删除历史";
    }else{
        cell.historyLable.text = self.dataSouce[indexPath.row];
    }
    cell.layer.borderColor = ECCOLOR(220, 220, 220, 1).CGColor;
    cell.layer.borderWidth = 0.5;
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == self.dataSouce.count) {
        MoxiConfig *config = [MoxiConfig shareInstance];
        config.history = nil;
        [config saveHistory:config.history];
        [self.collectionView reloadData];
    }else{
        [self.mySearch resignFirstResponder];
        ListViewController *vc = [[ListViewController alloc]init];
        vc.myTitle = self.dataSouce[indexPath.row];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }
}


#pragma mark -searchDelegate

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar{
    [self.mySearch resignFirstResponder];
    return YES;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    MoxiConfig *config = [MoxiConfig shareInstance];
    if (config.history != nil) {
        config.history = [[config.history stringByAppendingString:@","]stringByAppendingString:searchBar.text];
    }else{
        config.history = searchBar.text;
    }
    [config saveHistory:config.history];
    
    
    [self.mySearch resignFirstResponder];
    ListViewController *vc = [[ListViewController alloc]init];
    vc.myTitle = searchBar.text;
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.mySearch resignFirstResponder];
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
