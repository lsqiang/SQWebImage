
//
//  AppInfo.m
//  601-加载网络图片
//
//  Created by Fly on 15/6/1.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

+ (instancetype)appInfoWithDict:(NSDictionary *)dict {
    
    id obj = [[self alloc] init];
    [obj setValuesForKeysWithDictionary:dict];
    
    return obj;
}

+ (NSArray *)appList {
    
    //1.url
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"apps" withExtension:@"plist"];
    
    //2.array
    NSArray *array = [NSArray arrayWithContentsOfURL:url];
    
    //3.遍历获得模型arrayM
    NSMutableArray *arrayM = [NSMutableArray arrayWithCapacity:array.count];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        NSDictionary *dict = obj;
        [arrayM addObject:[AppInfo appInfoWithDict:dict]];
        
    }];
    return arrayM.copy;
}

@end
