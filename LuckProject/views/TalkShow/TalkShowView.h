//
//  TalkShowView.h
//  LuckProject
//
//  Created by moxi on 2017/10/26.
//  Copyright © 2017年 moxi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^OnHomeWorkTSTouch)();
typedef void(^OnHomeFqpTSTouch)();
typedef void(^OnHomeXslTSTouch)();
typedef void(^OnHomeDbhTSTouch)();

typedef void(^OnHomeBookMoreClick)();

@interface TalkShowView : UIView

@property (nonatomic,copy)OnHomeWorkTSTouch workTSTouch;
@property (nonatomic,copy)OnHomeFqpTSTouch fqpTSTouch;
@property (nonatomic,copy)OnHomeXslTSTouch xslTSTouch;
@property (nonatomic,copy)OnHomeDbhTSTouch dbhTSTouch;

@property (nonatomic, copy)OnHomeBookMoreClick moreClick;

-(void)showInView:(UIView*)hostView work:(void(^)())workClick fqp:(void(^)())fqpClick xsl:(void(^)())xslClick dbh:(void(^)())dbhClick more:(void(^)())moreClick;


@end
