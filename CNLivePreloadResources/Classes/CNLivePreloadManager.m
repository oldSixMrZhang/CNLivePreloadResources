//
//  CNLivePrefetchManager.m
//  CNLivePrefetchManager_Example
//
//  Created by CNLive-zxw on 2019/8/2.
//  Copyright © 2019 153993236@qq.com. All rights reserved.
//

#import "CNLivePreloadManager.h"

NSString *const AppEmotionString = @"0-[微笑];1-[撇嘴];2-[色];3-[发呆];4-[得意];5-[流泪];6-[害羞];7-[闭嘴];8-[睡];9-[大哭];10-[尴尬];11-[发怒];12-[调皮];13-[呲牙];14-[惊讶];15-[难过];16-[酷];17-[冷汗];18-[抓狂];19-[吐];20-[偷笑];21-[可爱];22-[白眼];23-[傲慢];24-[饥饿];25-[困];26-[惊恐];27-[流汗];28-[憨笑];29-[大兵];30-[奋斗];31-[咒骂];32-[疑问];33-[嘘];34-[晕];35-[折磨];36-[衰];37-[骷髅];38-[敲打];39-[再见];40-[擦汗];41-[抠鼻];42-[鼓掌];43-[糗大了];44-[坏笑];45-[左哼哼];46-[右哼哼];47-[哈欠];48-[鄙视];49-[委屈];50-[快哭了];51-[阴险];52-[亲亲];53-[吓];54-[可怜];55-[菜刀];56-[西瓜];57-[啤酒];58-[篮球];59-[乒乓];60-[咖啡];61-[饭];62-[猪头];63-[玫瑰];64-[凋谢];65-[示爱];66-[爱心];67-[心碎];68-[蛋糕];69-[闪电];70-[炸弹];71-[刀];72-[足球];73-[瓢虫];74-[便便];75-[月亮];76-[太阳];77-[礼物];78-[拥抱];79-[强];80-[弱];81-[握手];82-[胜利];83-[抱拳];84-[勾引];85-[拳头];86-[差劲];87-[爱你];88-[NO];89-[OK];90-[爱情];91-[飞吻];92-[跳跳];93-[发抖];94-[怄火];95-[转圈];96-[磕头];97-[回头];98-[跳绳];99-[挥手];100-[激动];101-[街舞];102-[献吻];103-[左太极];104-[右太极];105-[嘿哈];106-[捂脸];107-[奸笑];108-[机智];109-[皱眉];110-[耶];111-[红包];112-[鸡];113-[生病];114-[震惊];115-[金钱];116-[懵圈];117-[大眼];118-[保密];119-[宝宝];120-[装死];121-[666];122-[笑哭];123-[热];124-[比心];125-[送口红];126-[矿泉水]";

static NSMutableDictionary *resources;

@implementation CNLivePreloadManager

/**
 * 预加载全部资源
 */
+ (void)preloadAllResources{
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        // 刷新图片
        [strongSelf preloadModelForRefreshImage];
        // Gif封面
        [strongSelf preloadModelForGifCover];
        // Emotion表情
        [strongSelf preloadModelForEmotion];

    });
}

/**
 * 预加载
 */
+ (CNLivePreloadModel *)preloadModelForType:(CNLivePreloadType)type{
    switch (type) {
        case CNLivePreloadRefreshImage:// 刷新图片
        {
            [self preloadModelForRefreshImage];
        }
            break;
            
        case CNLivePreloadGifCover:// Gif封面图片
        {
            [self preloadModelForGifCover];
        }
            break;
            
        case CNLivePreloadEmotion:// Emotion表情
        {
            [self preloadModelForEmotion];
        }
            break;
            
    }
    return nil;
    
}
+ (NSArray<UIImage *> *)preloadImagesForType:(CNLivePreloadType)type{
    switch (type) {
        case CNLivePreloadRefreshImage:// 刷新图片
        {
            [self preloadImagesForRefreshImage];
        }
            break;
            
        case CNLivePreloadGifCover:// Gif封面图片
        {
            [self preloadImagesForGifCover];
        }
            break;
            
        case CNLivePreloadEmotion:// Emotion表情
        {
            [self preloadImagesForEmotion];
        }
            break;
            
    }
    return nil;
    
}

#pragma mark - 刷新图片
/**
 * 预加载刷新图片
 */
+ (CNLivePreloadModel *)preloadModelForRefreshImage {
    NSMutableArray<NSString *> *names = [[NSMutableArray alloc] init];
    for (int i = 0; i < 30; i++) {
        [names addObject:[NSString stringWithFormat:@"activity_load%d",i]];

    }
    CNLivePreloadModel *model = [CNLivePreloadManager preloadModelForPreloadId:@"RefreshImage" type:CNLiveResourceImage imageNames:names];
    return model;
    
}
+ (NSArray<UIImage *> *)preloadImagesForRefreshImage{
    CNLivePreloadModel *model = [CNLivePreloadManager preloadModelForRefreshImage];
    return model.images;
    
}

#pragma mark - Gif封面
/**
 * 预加载Gif封面
 */
+ (CNLivePreloadModel *)preloadModelForGifCover{
    NSMutableArray<NSString *> *names = [[NSMutableArray alloc] init];
    for (int i = 0; i < 30; i++) {
        [names addObject:[NSString stringWithFormat:@"activity_load%d",i]];
        
    }
    CNLivePreloadModel *model = [CNLivePreloadManager preloadModelForPreloadId:@"GifCover" type:CNLiveResourceImage imageNames:names];
    return model;
    
}
+ (NSArray<UIImage *> *)preloadImagesForGifCover{
    CNLivePreloadModel *model = [CNLivePreloadManager preloadModelForGifCover];
    return model.images;
    
}

#pragma mark - Emotion
/**
 * 预加载Emotion表情
 */
+ (CNLivePreloadModel *)preloadModelForEmotion {
    //本地Emotion的名字
    NSArray<NSString *> *array = [AppEmotionString componentsSeparatedByString:@";"];
    NSMutableArray<NSString *> *names = [[NSMutableArray alloc] init];
    for (NSString *str in array) {
        NSArray<NSString *> *item = [str componentsSeparatedByString:@"-"];
        [names addObject:[NSString stringWithFormat:@"smiley_%@", item.firstObject]];
    }
    CNLivePreloadModel *model = [CNLivePreloadManager preloadModelForPreloadId:@"Emotion" type:CNLiveResourceImage imageNames:names];
    return model;

}
+ (NSArray<UIImage *> *)preloadImagesForEmotion{
    CNLivePreloadModel *model = [CNLivePreloadManager preloadModelForEmotion];
    return model.images;
    
}

/**
 *  预加载资源
 *
 *  @param preloadId 加载标识
 *  @param type 资源类型
 *  @param imageNames 资源名字数组
 *
 *  @return 模型
 */
+ (CNLivePreloadModel *)preloadModelForPreloadId:(NSString *)preloadId type:(CNLiveResourceType)type imageNames:(NSArray<NSString *> *)imageNames {
    if (resources) {// resources存在
        CNLivePreloadModel *model = resources[preloadId];
        if(model){// model存在
            if (!model.isLoadFailed) {//全部加载成功
                return model;
            }else{
                if(!model.isLoading) {
                    [self asyncLoadResources:model type:type];
                }
                return model;
            }
            
        }
    }
    
    CNLivePreloadModel *model = [[CNLivePreloadModel alloc]init];
    model.isLoading = NO;
    model.ID = preloadId;
    NSMutableArray<CNLiveResourceModel *> *models = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < imageNames.count; i++) {
        CNLiveResourceModel *model = [[CNLiveResourceModel alloc]init];
        model.name = imageNames[i];
        model.type = CNLiveResourceGif;
        [models addObject:model];
    }
    model.models = [NSArray arrayWithArray:models];
    if(resources){
        [resources setValue:model forKey:preloadId];
        
    }else{
        resources = [NSMutableDictionary dictionaryWithObject:model forKey:preloadId];
        
    }
    
    [self asyncLoadResources:model type:type];
    
    return model;
}

#pragma mark - 私有方法
/**
 *  在子线程预加载
 *
 *  @param model 模型
 *  @param type 资源类型
 *
 */
+ (void)asyncLoadResources:(CNLivePreloadModel *)model type:(CNLiveResourceType)type{
    model.isLoading = YES;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        switch (type) {
            case CNLiveResourceImage:
            {
                NSMutableArray<UIImage *> *images = [[NSMutableArray alloc] init];
                for (CNLiveResourceModel *resourceModel in model.models) {
                    if (resourceModel.image == nil) {
                        UIImage *image = [CNLivePreloadManager cn_getImageName:resourceModel.name bundle:@"CNLivePreloadResources.bundle/CNLivePreloadResources" targetClass:[CNLivePreloadManager class]];
                        if (image == nil) {
                            model.isLoadFailed = YES;
                        }
                        else{
                            resourceModel.image = image;
                            [images addObject:image];
                            model.isLoadFailed = NO;
                        }
                    }
                }
                model.images = [NSArray arrayWithArray:images];
                model.isLoading = NO;
            }
                break;
            case CNLiveResourceGif:
            {
                
            }
                break;
            case CNLiveResourceText:
            {
                
            }
                break;
                
        }
        
    });
    
}

/**
 *  创建图片
 *
 *  @param imageName 图片名字
 *  @param bundlePath 图片所在的bundle名字
 *  @param targetClass 类和bundle的同级目录
 *  @return 返回UIImage
 */
+ (UIImage *)cn_getImageName:(NSString *)imageName bundle:(NSString *)bundlePath targetClass:(Class)targetClass{
    NSBundle *bundle = [NSBundle bundleForClass:targetClass];
    NSURL *url = [bundle URLForResource:bundlePath withExtension:@"bundle"];
    NSBundle *targetBundle = [NSBundle bundleWithURL:url];
    UIImage *image = [UIImage imageNamed:imageName inBundle:targetBundle compatibleWithTraitCollection:nil];
    return image?image:[UIImage imageNamed:imageName inBundle:[NSBundle mainBundle] compatibleWithTraitCollection:nil];
    
}

@end
