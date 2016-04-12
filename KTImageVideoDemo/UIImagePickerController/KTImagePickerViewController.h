//
//  KTImagePickerViewController.h
//  KTImageVideoDemo
//
//  Created by tujinqiu on 16/4/12.
//  Copyright © 2016年 tujinqiu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, KTImagePickerViewControllerType)
{
    KTImagePickerViewControllerTypeTakePicture = 0,
    KTImagePickerViewControllerTypeAlbum,
    KTImagePickerViewControllerTypeTakeVideo
};

@interface KTImagePickerViewController : UIViewController

- (instancetype)initWithType:(KTImagePickerViewControllerType)type;

@end
