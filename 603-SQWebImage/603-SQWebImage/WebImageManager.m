//
//  WebImageManager.m
//  603-SQWebImage
//
//  Created by Fly on 15/6/3.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "WebImageManager.h"
#import "WebImageOperation.h"
#import "NSString+path.h"

@interface WebImageManager ()

@property (strong, nonatomic) NSOperationQueue *downloadQueue;
@property (strong, nonatomic) NSMutableDictionary *opCache;//操作缓存
@property (strong, nonatomic) NSMutableDictionary *imgCache;//图片缓存

@end

@implementation WebImageManager

- (NSMutableDictionary *)imgCache {
    if (_imgCache == nil) {
        _imgCache = [[NSMutableDictionary alloc] init];
    }
    return _imgCache;
}

- (NSMutableDictionary *)opCache {
    if (_opCache == nil) {
        _opCache = [[NSMutableDictionary alloc] init];
    }
    return _opCache;
}

- (NSOperationQueue *)downloadQueue {
    if (_downloadQueue == nil) {
        _downloadQueue = [[NSOperationQueue alloc] init];
    }
    return _downloadQueue;
}


+ (instancetype)shareWebImage {
    
    static id obj;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (obj == nil) {
            obj = [[self alloc] init];
        }
    });
    
    return obj;
}

- (void)webImageOperationWithURL:(NSString *)url finishedBlock:(void(^)(UIImage *img)) finishedBlock {
    
    //操作重复判断
    if (self.opCache[url] != nil) {
        NSLog(@"重复操作，请等待。。。");
        return;
    }
    
    //图片缓存
    if ([self checkChche:url]) {
        finishedBlock(self.imgCache[url]);
        return;
    }
    
    //下载操作(下载结束从缓冲池中移除)
    WebImageOperation *downloadOp = [WebImageOperation webImageOperationWithURL:url finishedBlock:^(UIImage *img) {
        finishedBlock(img);
        [self.opCache removeObjectForKey:url];
    }];
    
    //执行下载
    [self.opCache setObject:downloadOp forKey:url];
    [self.downloadQueue addOperation:downloadOp];
    
    
}

//判断缓存是否存在
- (BOOL)checkChche:(NSString *)url {
    
    //图片缓存
    if (self.imgCache[url] != nil) {
        NSLog(@"从缓存中加载");
        return YES;
    }
    
    //沙盒缓存
    NSData *imgData = [NSData dataWithContentsOfFile:url.appendDocumentPath];
    if (imgData != nil) {
        NSLog(@"从沙盒中加载");
        [self.imgCache setObject:[UIImage imageWithData:imgData] forKey:url];
        return YES;
    }
    
    return NO;
}

- (void)cancelWebImageOpWithURL:(NSString *)url {
    
    WebImageOperation *downloadOp = self.opCache[url];
    if (downloadOp == nil) return;
    
    [downloadOp cancel];
    [self.opCache removeObjectForKey:url];
}


@end
