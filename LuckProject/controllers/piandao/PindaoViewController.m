//
//  PindaoViewController.m
//  LuckProject
//
//  Created by moxi on 2017/10/25.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "PindaoViewController.h"

#import "ListViewController.h"
#import "PindaoCollectionViewCell.h"

@interface PindaoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)NSArray *images;
@property (nonatomic, strong)NSArray *titles;

@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation PindaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self createUI];
    self.titles = @[@"旅游",@"科技",@"资讯",@"商业财经",@"名校公开课",@"情感生活",@"戏曲",@"百家讲坛",@"广播剧",@"健康养生",@"历史人文",@"3D体验馆",@"时尚生活",@"动漫游戏",@"汽车",@"散文"];
    self.images = @[@"trip",@"IT",@"zx",@"cj",@"gkk",@"qg",@"xiqu1",@"bjjt",@"gbj",@"ys",@"lsrw",@"tyg",@"ss",@"dm",@"car",@"sw"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -UI

-(void)createUI{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(0, 0, 32, 32);
    [rightBtn setImage:ECIMAGENAME(@"musicFlag") forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(popPlayerClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = item;
    
    CGFloat topHeight;
    CGFloat version = [[[UIDevice currentDevice]systemVersion] floatValue];
    if (version >= 11.0) {
        CGRect StatusRect = [[UIApplication sharedApplication] statusBarFrame];
        CGRect NavRect = self.navigationController.navigationBar.frame;
        topHeight = StatusRect.size.height + NavRect.size.height;
    }else{
        topHeight = 64;
    }
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    UICollectionViewFlowLayout *flowLayout1 = [[UICollectionViewFlowLayout alloc]init];
    flowLayout1.minimumInteritemSpacing = 2;
    flowLayout1.minimumLineSpacing = 2;
    flowLayout1.itemSize = CGSizeMake(DREAMCSCREEN_W/2 - 6,DREAMCSCREEN_W/2 + 50);
    flowLayout1.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    flowLayout1.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, topHeight, DREAMCSCREEN_W, DREAMCSCREEN_H - topHeight) collectionViewLayout:flowLayout1];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.collectionView registerNib:[UINib nibWithNibName:@"PindaoCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"pindaocell"];
                              
    [self.view addSubview:self.collectionView];
}

-(void)popPlayerClick:(UIButton*)button{
    
    MusicPlayerViewController *vc = [MusicPlayerViewController sharedInstance];
    [self presentViewController:vc animated:YES completion:nil];
}


#pragma mark -collection


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.images.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PindaoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pindaocell" forIndexPath:indexPath];
    cell.headView.image = ECIMAGENAME(self.images[indexPath.row]);
    cell.pdLable.text = self.titles[indexPath.row];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ListViewController *vc = [[ListViewController alloc]init];
    vc.myTitle = self.titles[indexPath.row];
    self.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
    self.hidesBottomBarWhenPushed = NO;
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
