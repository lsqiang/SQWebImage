//
//  WebImageManager.h
//  603-SQWebImage
//
//  Created by Fly on 15/6/3.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebImageManager : NSObject

+ (instancetype)shareWebImage;//单例
- (void)webImageOperationWithURL:(NSString *)url finishedBlock:(void(^)(UIImage *img)) finishedBlock;//下载操作
- (void)cancelWebImageOpWithURL:(NSString *)url;//取消操作


@end
