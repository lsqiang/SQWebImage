//
//  WebImageOperation.h
//  603-SQWebImage
//
//  Created by Fly on 15/6/3.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebImageOperation : NSOperation

+ (instancetype)webImageOperationWithURL:(NSString *)url finishedBlock:(void(^)(UIImage *img)) finishedBlock;

@end
