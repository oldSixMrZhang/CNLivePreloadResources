//
//  CNLivePreloadModel.h
//  CNLivePreloadModel_Example
//
//  Created by CNLive-zxw on 2019/8/2.
//  Copyright © 2019 153993236@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
//加载类型
typedef NS_ENUM(NSInteger, CNLivePreloadType) {
    CNLivePreloadRefreshImage,    // 动画图片
    CNLivePreloadGifCover,        // Gif封面
    CNLivePreloadEmotion          // Emotion

};

//资源类型(目前只支持图片类型)
typedef NS_ENUM(NSInteger, CNLiveResourceType) {
    CNLiveResourceImage,    // 动画图片
    CNLiveResourceGif,      // Gif
    CNLiveResourceText      // 文本
};

// 资源类型(1.图片 2.Gif  3.文本)
@interface CNLiveResourceModel : NSObject
// 标识
@property (nonatomic, copy) NSString *ID;
// 名字
@property (nonatomic, copy) NSString *name;
// 路径
@property (nonatomic, copy) NSString *path;
// 描述
@property (nonatomic, copy) NSString *desc;
// UIImage
@property (nonatomic, strong) UIImage *image;
// 类型
@property (nonatomic, assign) CNLiveResourceType type;

@end

// 某一种类型的资源(1.刷新图片  2.Gif封面  3.Emotion)
@interface CNLivePreloadModel : NSObject
// 是否存在加载失败
@property (nonatomic, assign) BOOL isLoadFailed;
// 是否正在加载
@property (nonatomic, assign) BOOL isLoading;
// 标识
@property (nonatomic, copy) NSString *ID;
// UIImage
@property (nonatomic, strong) NSArray *images;
// CNLiveResourceModel数组
@property (nonatomic, strong) NSArray<CNLiveResourceModel *> *models;
// 类型
@property (nonatomic, assign) CNLivePreloadType type;

@end

NS_ASSUME_NONNULL_END
