//
//  WebImageView.m
//  603-SQWebImage
//
//  Created by Fly on 15/6/3.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "WebImageView.h"
#import "WebImageManager.h"

@interface WebImageView ()

@property (copy, nonatomic) NSString *currentURL;

@end

@implementation WebImageView

- (void)setWebImage:(NSString *)url {

    //一个还没下载完，就开始下载另外一个
    if (![url isEqualToString:self.currentURL]) {
        [[WebImageManager shareWebImage] cancelWebImageOpWithURL:self.currentURL];
    }
    self.currentURL = url;
    
    [[WebImageManager shareWebImage] webImageOperationWithURL:url finishedBlock:^(UIImage *img) {
        self.image = img;
    }];
}

@end
