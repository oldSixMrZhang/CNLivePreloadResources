//
//  CNLivePreloadManager.h
//  CNLivePrefetchManager_Example
//
//  Created by CNLive-zxw on 2019/8/2.
//  Copyright © 2019 153993236@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CNLivePreloadModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CNLivePreloadManager : NSObject
/**
 *  预加载资源
 *
 *  @param preloadId 加载标识(1.刷新图片 -> RefreshImage  2.Gif封面 -> GifCover  3.Emotion -> Emotion)
 *  @param type 资源类型(目前只支持图片类型CNLiveResourceImage)
 *  @param imageNames 资源名字数组
 *
 *  @return 模型
 */
+ (CNLivePreloadModel *)preloadModelForPreloadId:(NSString *)preloadId type:(CNLiveResourceType)type imageNames:(NSArray<NSString *> *)imageNames;


#pragma mark - 针对具体业务
/**
* 预加载全部资源
* 在 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions; 方法中调用
*/
+ (void)preloadAllResources;


/**
 * 预加载
 */
+ (CNLivePreloadModel *)preloadModelForType:(CNLivePreloadType)type;
+ (NSArray<UIImage *> *)preloadImagesForType:(CNLivePreloadType)type;


/**
 * 预加载刷新图片
 */
+ (CNLivePreloadModel *)preloadModelForRefreshImage;
+ (NSArray<UIImage *> *)preloadImagesForRefreshImage;


/**
 * 预加载Gif表情封面
 */
+ (CNLivePreloadModel *)preloadModelForGifCover;
+ (NSArray<UIImage *> *)preloadImagesForGifCover;


/**
 * 预加载Emotion表情
 */
+ (CNLivePreloadModel *)preloadModelForEmotion;
+ (NSArray<UIImage *> *)preloadImagesForEmotion;


@end

NS_ASSUME_NONNULL_END
