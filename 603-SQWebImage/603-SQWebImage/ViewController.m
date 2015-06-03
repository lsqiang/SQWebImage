//
//  ViewController.m
//  603-SQWebImage
//
//  Created by Fly on 15/6/3.
//  Copyright (c) 2015年 itheima. All rights reserved.
//

#import "ViewController.h"
#import "WebImageOperation.h"
#import "AppInfo.h"
#import "WebImageManager.h"
#import "WebImageView.h"
#import "AppCell.h"

@interface ViewController ()

@property (strong, nonatomic) NSArray *appList;

@property (weak, nonatomic) IBOutlet WebImageView *imgView;


@end

@implementation ViewController

- (NSArray *)appList {
    
    if (_appList == nil) {
        _appList = [AppInfo appList];
    }
    
    return _appList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.appList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    AppInfo *app = self.appList[indexPath.row];
    
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AppCell" forIndexPath:indexPath];
    
    cell.nameLabel.text = app.name;
    cell.downloadLabel.text = app.download;
    [cell.iconView setWebImage:app.icon];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
