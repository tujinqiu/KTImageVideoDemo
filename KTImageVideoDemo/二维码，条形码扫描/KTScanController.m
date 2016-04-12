//
//  KTScanController.m
//  KTImageVideoDemo
//
//  Created by tujinqiu on 16/4/12.
//  Copyright © 2016年 tujinqiu. All rights reserved.
//

#import "KTScanController.h"

@interface KTScanController ()

@end

@implementation KTScanController

- (instancetype)initWithScanType:(KTScanType)scanType
{
    KTScanViewController *scanVC = [[KTScanViewController alloc] initWithScanType:scanType];
    return [self initWithRootViewController:scanVC];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@synthesize delegate = _delegate;

@end
