//
//  RootTableViewController.m
//  KTImageVideoDemo
//
//  Created by tujinqiu on 16/4/12.
//  Copyright © 2016年 tujinqiu. All rights reserved.
//

#import "RootTableViewController.h"
#import "KTImagePickerViewController.h"
#import "KTScanController.h"

@interface RootTableViewController ()<KTScanControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, copy) NSArray *titles;

@end

@implementation RootTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[
                    @"音效",
                    @"音乐",
                    @"音频会话",
                    @"录音",
                    @"音频队列",
                    @"MPMoviePlayerController",
                    @"MPMoviePlayerViewController",
                    @"AVPlayer",
                    @"UIImagePickerController拍照",
                    @"UIImagePickerController相册选取图片",
                    @"UIImagePickerController视频录制",
                    @"AVFoundation拍照",
                    @"AVFoundation录制视频",
                    @"二维码，条形码扫描",
                    @"多张图片选择"
                    ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titles.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = [self.titles objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    switch (indexPath.row)
    {
        case 8:
        {
            KTImagePickerViewController *picker = [[KTImagePickerViewController alloc] initWithType:KTImagePickerViewControllerTypeTakePicture];
            [self.navigationController pushViewController:picker animated:YES];
        }
            break;
            
        case 9:
        {
            KTImagePickerViewController *picker = [[KTImagePickerViewController alloc] initWithType:KTImagePickerViewControllerTypeAlbum];
            [self.navigationController pushViewController:picker animated:YES];
        }
            break;
            
        case 10:
        {
            KTImagePickerViewController *picker = [[KTImagePickerViewController alloc] initWithType:KTImagePickerViewControllerTypeTakeVideo];
            [self.navigationController pushViewController:picker animated:YES];
        }
            break;
            
        case 13:
        {
            KTScanController *scanController = [[KTScanController alloc] initWithScanType:KTScanTypeQR];
            scanController.delegate = self;
            [self presentViewController:scanController animated:YES completion:nil];
        }
            break;
            
        default:
            break;
    }
}

- (void)scanController:(KTScanController *)scanController didScanedResult:(NSString *)result
{
    NSLog(@"result:%@", result);
    [scanController dismissViewControllerAnimated:YES completion:nil];
}

@end
