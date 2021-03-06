//
//  DetialModel.h
//  LuckProject
//
//  Created by moxi on 2017/10/25.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import "BaseModel.h"

@interface DetialModel : BaseModel

@property (nonatomic, assign)NSInteger albumId;
@property (nonatomic, copy)NSString *albumTitle;
@property (nonatomic, copy)NSString *duration;
@property (nonatomic, assign)NSInteger id;
@property (nonatomic, copy)NSString *intro;
@property (nonatomic, copy)NSString *playurl;
@property (nonatomic, copy)NSString *thumb;
@property (nonatomic, copy)NSString *title;

@end
