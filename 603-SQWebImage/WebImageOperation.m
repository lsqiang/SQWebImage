//
//  WebImageOperation.m
//  603-SQWebImage
//
//  Created by Fly on 15/6/3.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "WebImageOperation.h"
#import "NSString+path.h"

@interface WebImageOperation ()

@property (copy, nonatomic) NSString *url;

@property (copy, nonatomic) void(^finishedBlock)(UIImage *img);

@end

@implementation WebImageOperation

+ (instancetype)webImageOperationWithURL:(NSString *)url finishedBlock:(void(^)(UIImage *img)) finishedBlock {
    
    WebImageOperation *webOp = [[self alloc] init];
    webOp.url = url;
    webOp.finishedBlock = finishedBlock;
    
    return webOp;
}

//执行的时候会调用main方法
- (void)main {
    
    WS(weakSelf);
    
    if (self.isCancelled) return;
    NSAssert(self.finishedBlock != nil, @"没有传递block值");
    
    [NSThread sleepForTimeInterval:1.5];
    UIImage *img = [UIImage imageNamed:self.url];
    if (self.isCancelled) return;
    
    //将数据保存至沙盒
    NSData *imgData = UIImageJPEGRepresentation(img, 0.7);
    [imgData writeToFile:self.url.appendDocumentPath atomically:YES];
    
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        weakSelf.finishedBlock(img);
    }];
    
}

- (void)start {

    [super start];
}


@end
