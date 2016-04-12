//
//  KTScanViewController.m
//  KTImageVideoDemo
//
//  Created by tujinqiu on 16/4/12.
//  Copyright © 2016年 tujinqiu. All rights reserved.
//

#import "KTScanViewController.h"

@interface KTScanViewController ()

@property (nonatomic, assign) KTScanType scanType;

@end

@implementation KTScanViewController

- (instancetype)initWithScanType:(KTScanType)scanType
{
    if (self = [super init])
    {
        _scanType = scanType;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
