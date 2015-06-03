//
//  AppCell.h
//  03-加载网路图片
//
//  Created by apple on 15/6/1.
//  Copyright (c) 2015年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WebImageView;

@interface AppCell : UITableViewCell
@property (weak, nonatomic) IBOutlet WebImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *downloadLabel;

@end
