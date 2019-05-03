//
//  UCRouter.h
//  Pods
//
//  Created by Link on 2019/5/3.
//

#import <Foundation/Foundation.h>
#import "UCRouterProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface UCRouter : NSObject

/// 存储路由信息的字典
@property(nonatomic, strong, readonly) NSDictionary<NSString *, UCRouterInfo *>* routerInfo;

+ (nonnull instancetype)shared;

/// 设置导航代理以及过滤代理
- (void)setNavgationAndUrlFilter:(nonnull id<UCRouterNavgationable>)navgationDelegate
                  filterDelegate:(nonnull id<UCRouterUrlFilterable>)filterDelegate;

/// 注册协议以及实现协议的对象
- (void)registProtocolAndProvider:(nonnull Protocol<UCRouterable> *)protocol
                         provider:(nonnull id<UCRouterable>)provider;

/// 获取实现协议的对象
- (nullable id<UCRouterable>)getProviderWithProtocol:(nonnull Protocol<UCRouterable> *)protocol;

/// 注册url
- (void)registWithUrlStr:(nonnull NSString *)urlStr
  viewControllerCallBack:(nullable UIViewController* (^)(UCRouterInfo * nonnull))viewControllerCallBack;

/// 路由派发
- (void)routeUrlStr:(nonnull NSString *)urlStr
      navgationType:(UCNavgationType)navgationType
             params:(nullable NSDictionary<NSString *, NSString *> *)params;
@end

NS_ASSUME_NONNULL_END
