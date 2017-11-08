//
//  MusicPlayerViewController.h
//  LuckProject
//
//  Created by moxi on 2017/10/25.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "BaseViewController.h"

#import "DetialModel.h"

@interface MusicPlayerViewController : BaseViewController

@property (nonatomic, strong)DetialModel *model;
@property (nonatomic, strong)NSMutableArray *modelArr;
@property (nonatomic, assign)NSInteger currtenflag;

+ (instancetype)sharedInstance;

-(void)playCurrtnItem:(DetialModel*)model;

@end
