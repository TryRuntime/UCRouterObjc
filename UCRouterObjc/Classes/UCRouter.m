//
//  UCRouter.m
//  Pods
//
//  Created by Link on 2019/5/3.
//

#import "UCRouter.h"
#import "UCRouterUrlParser.h"

@implementation UCRouter
static NSMutableDictionary<NSString *, UCRouterInfo *>* _routerInfoMDict;
static NSMutableDictionary<NSString *, id<UCRouterable>> * _protocolMDict;
static id<UCRouterNavgationable> _navgationDelegate;
static id<UCRouterUrlFilterable> _filterDelegate;

static inline void initRouterInfoMDict() {
    if (_routerInfoMDict == nil) {
        _routerInfoMDict = [NSMutableDictionary dictionary];
    }
}

static inline void initProtocolMDict() {
    if (_protocolMDict == nil) {
        _protocolMDict = [NSMutableDictionary dictionary];
    }
}
- (NSDictionary<NSString *, UCRouterInfo *> *)routerInfo {
    initRouterInfoMDict();
    return [_routerInfoMDict copy];
}

+ (nonnull instancetype)shared {
    static UCRouter *_router;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _router = [[UCRouter alloc] init];
        initRouterInfoMDict();
        initProtocolMDict();
    });
    return _router;
}

- (void)setNavgationAndUrlFilter:(nonnull id<UCRouterNavgationable>)navgationDelegate
                  filterDelegate:(nonnull id<UCRouterUrlFilterable>)filterDelegate {
    _navgationDelegate = navgationDelegate;
    _filterDelegate = filterDelegate;
}

- (void)registProtocolAndProvider:(nonnull Protocol<UCRouterable> *)protocol
                         provider:(nonnull id<UCRouterable>)provider {
    if (protocol != nil && provider != nil && [provider conformsToProtocol:@protocol(UCRouterable)]) {
        _protocolMDict[NSStringFromProtocol(protocol)] = provider;
        [provider registerRouter];
    }
}

- (nullable id<UCRouterable>)getProviderWithProtocol:(nonnull Protocol<UCRouterable> *)protocol {
    if (protocol == nil) return nil;
    return _protocolMDict[NSStringFromProtocol(protocol)];
}

- (void)registWithUrlStr:(nonnull NSString *)urlStr
  viewControllerCallBack:(UIViewController* (^)(UCRouterInfo *routerInfo))viewControllerCallBack {
    UCRouterInfo *routerInfo = [[UCRouterInfo alloc] initRegistUrlStr:urlStr
                                               viewControllerCallBack:viewControllerCallBack];
    _routerInfoMDict[urlStr] = routerInfo;
}

- (void)routeUrlStr:(nonnull NSString *)urlStr
      navgationType:(UCNavgationType)navgationType
             params:(nullable NSDictionary<NSString *, NSString *> *)params {
    
    // 获取路由信息
    UCRouterInfo *routerInfo = [UCRouterUrlParser parseUrl:urlStr params:params];
    if (routerInfo == nil) return;
    
    // 获取控制器
    UIViewController *vc = routerInfo.viewControllerCallBack(routerInfo);
    if (vc == nil) return;
    
    // 过滤
    if (![_filterDelegate shouldOpenRouter:routerInfo jumpViewController:vc navgationType:navgationType]) return;
    
    // 跳转
    switch (navgationType) {
        case pushWithAnimation:
            [_navgationDelegate pushViewController:vc animated:YES];
            break;
        case pushWithNoAnimation:
            [_navgationDelegate pushViewController:vc animated:NO];
            break;
        case presentWithAnimation:
            [_navgationDelegate presentViewController:vc animated:YES completion:nil];
            break;
        case presentWithNoAnimation:
            [_navgationDelegate presentViewController:vc animated:NO completion:nil];
            break;
    }
}
@end
