//
//  KTScanController.h
//  KTImageVideoDemo
//
//  Created by tujinqiu on 16/4/12.
//  Copyright © 2016年 tujinqiu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KTScanViewController.h"

@class KTScanController;

@protocol KTScanControllerDelegate <NSObject>

@optional
- (void)scanController:(KTScanController *)scanController didScanedResult:(NSString *)result;

@end

@interface KTScanController : UINavigationController

@property (nonatomic, weak) id<UINavigationControllerDelegate, KTScanControllerDelegate> delegate;

- (instancetype)initWithScanType:(KTScanType)scanType;

@end
