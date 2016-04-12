//
//  KTImagePickerViewController.m
//  KTImageVideoDemo
//
//  Created by tujinqiu on 16/4/12.
//  Copyright © 2016年 tujinqiu. All rights reserved.
//

#import "KTImagePickerViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface KTImagePickerViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, assign) KTImagePickerViewControllerType type;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation KTImagePickerViewController

- (instancetype)initWithType:(KTImagePickerViewControllerType)type
{
    if (self = [super init])
    {
        _type = type;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    switch (self.type)
    {
        case KTImagePickerViewControllerTypeTakePicture:
            [self.button setTitle:@"拍照" forState:UIControlStateNormal];
            break;
            
        case KTImagePickerViewControllerTypeAlbum:
            [self.button setTitle:@"从相册选取照片" forState:UIControlStateNormal];
            break;
            
        case KTImagePickerViewControllerTypeTakeVideo:
            [self.button setTitle:@"拍摄视频" forState:UIControlStateNormal];
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapButton:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    switch (self.type)
    {
        case KTImagePickerViewControllerTypeTakePicture:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:picker animated:YES completion:nil];
            }
            break;
            
        case KTImagePickerViewControllerTypeAlbum:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
            {
                picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                [self presentViewController:picker animated:YES completion:nil];
            }
            break;
            
        case KTImagePickerViewControllerTypeTakeVideo:
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                picker.sourceType = UIImagePickerControllerSourceTypeCamera;
                picker.videoQuality = UIImagePickerControllerQualityTypeIFrame1280x720;
                picker.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
                picker.mediaTypes = @[(NSString *)kUTTypeMovie];
                [self presentViewController:picker animated:YES completion:nil];
            }
            break;
            
        default:
            break;
    }
}

- (UIRectEdge)edgesForExtendedLayout
{
    return UIRectEdgeNone;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        self.imageView.image = image;
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        NSURL *url = [info objectForKey:UIImagePickerControllerMediaURL];
        NSData *data = [NSData dataWithContentsOfURL:url];
        NSString *file = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
        file = [file stringByAppendingPathComponent:@"temp.mov"];
        if (![data writeToFile:file atomically:YES])
        {
            NSLog(@"保存视频文件出错！");
        }
    }
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

@end
