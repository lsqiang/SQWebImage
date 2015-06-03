//
//  AppInfo.h
//  601-加载网络图片
//
//  Created by Fly on 15/6/1.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppInfo : NSObject

@property(nonatomic, copy) NSString *name;
@property(nonatomic, copy) NSString *icon;
@property(nonatomic, copy) NSString *download;

@property (strong, nonatomic) UIImage *img;

+ (instancetype)appInfoWithDict:(NSDictionary *)dict;

+ (NSArray *)appList;

@end
