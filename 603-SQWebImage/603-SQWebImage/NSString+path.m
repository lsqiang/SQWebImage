//
//  NSString+path.m
//  601-网络图片(Git)
//
//  Created by Fly on 15/6/2.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "NSString+path.h"

@implementation NSString (path)

- (NSString *)appendDocumentPath {
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    
    return [path stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)appendCachePath {
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    
    return [path stringByAppendingPathComponent:self.lastPathComponent];
}

- (NSString *)appendTempPath {
    
    return [NSTemporaryDirectory() stringByAppendingPathComponent:self.lastPathComponent];
}

@end
