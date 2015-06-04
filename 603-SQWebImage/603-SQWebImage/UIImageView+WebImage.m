//
//  UIImageView+WebImage.m
//  603-SQWebImage
//
//  Created by Fly on 15/6/4.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "UIImageView+WebImage.h"
#import "WebImageManager.h"
#import <objc/runtime.h>

@interface UIImageView ()

@property (copy, nonatomic) NSString *currentURL;

@end

@implementation UIImageView (WebImage)

- (void)setWebImage:(NSString *)url {
    
    WS(weakSelf);
    
    //取消之前下载操作
    if (![url isEqualToString:self.currentURL]) {
        [[WebImageManager shareWebImage] cancelWebImageOpWithURL:self.currentURL];
        
        self.image = nil;
    }
    self.currentURL = url;
    
    [[WebImageManager shareWebImage] webImageOperationWithURL:url finishedBlock:^(UIImage *img) {
        weakSelf.image = img;
    }];
}

//分类中的属性没有，setter、getter方法
//需要通过动态关联属性
const void * HMURLStringKey = "HMURLStringKey";
- (NSString *)currentURL {
    
    return objc_getAssociatedObject(self, HMURLStringKey);
}

- (void)setCurrentURL:(NSString *)currentURL {
    objc_setAssociatedObject(self, HMURLStringKey, currentURL, OBJC_ASSOCIATION_ASSIGN);
}

@end
