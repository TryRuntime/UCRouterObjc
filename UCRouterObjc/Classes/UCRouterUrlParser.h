//
//  UCRouterUrlParser.h
//  Pods
//
//  Created by Link on 2019/5/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UCRouterInfo : NSObject

/// 原始注册url
@property(nonatomic, copy, readonly) NSString *registUrlStr;
/// 原始viewController生成器
@property(nonatomic, copy, readonly) UIViewController* (^viewControllerCallBack)(UCRouterInfo *);

/// 在初始化之后不应该更改二者的值
- (instancetype)initRegistUrlStr:(NSString *)urlStr
          viewControllerCallBack:(UIViewController* (^)(UCRouterInfo *))viewControllerCallBack;

/// URL解码后的信息
@property(nonatomic, copy, readonly) NSString *urlScheme;
@property(nonatomic, copy, readonly) NSString *urlHost;
@property(nonatomic, copy, readonly) NSString *urlPath;
@property(nonatomic, copy, readonly) NSDictionary<NSString *, NSString *> *urlQuery;
@property(nonatomic, copy, readonly) NSString *encodeUrlStr;

/// 清除上面的url解码信息
- (void)clearUrlInfo;

/// 设置url解码信息
- (void)setUrlInfo:(NSString *)scheme
              host:(NSString *)host
              path:(NSString *)path
             query:(NSDictionary<NSString *, NSString*> *)query
      encodeUrlStr:(NSString *)encodeUrlStr;
@end

@interface UCRouterUrlParser : NSObject

/// 解析url, 如果找到注册过的url信息直接返回,找不到返回nil
+ (nullable UCRouterInfo *)parseUrl:(nonnull NSString *)urlStr
                             params:(nullable NSDictionary<NSString *, NSString *> *)params;
@end

NS_ASSUME_NONNULL_END
