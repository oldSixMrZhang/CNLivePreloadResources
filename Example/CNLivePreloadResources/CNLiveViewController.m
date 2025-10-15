//
//  CNLiveViewController.m
//  CNLivePreloadResources
//
//  Created by 153993236@qq.com on 08/09/2019.
//  Copyright (c) 2019 153993236@qq.com. All rights reserved.
//

#import "CNLiveViewController.h"
#import "CNLivePreloadManager.h"

@interface CNLiveViewController ()

@end

@implementation CNLiveViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *image1 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 30)];
    image1.backgroundColor = [UIColor redColor];
    [self.view addSubview:image1];
    
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 200, 30, 30)];
    image2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:image2];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 300, 100, 30)];
    titleLabel.backgroundColor = [UIColor blueColor];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.numberOfLines = 1;
    [self.view addSubview:titleLabel];
    titleLabel.text = nil;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray *add1 = [CNLivePreloadManager preloadImagesForRefreshImage];
        image1.animationImages = add1;//将序列帧数组赋给UIImageView的animationImages属性
        image1.animationDuration = 1.0;//设置动画时间
        image1.animationRepeatCount = 0;//设置动画次数 0 表示无限
        [image1 startAnimating];//开始播放动
        
//        NSArray *add2 = [CNLivePreloadManager preloadImagesForEmotion];
//        image2.image = add2[2];
        
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
