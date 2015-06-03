//
//  NSString+path.h
//  601-网络图片(Git)
//
//  Created by Fly on 15/6/2.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (path)

- (NSString *)appendDocumentPath;

- (NSString *)appendCachePath;

- (NSString *)appendTempPath;


@end
