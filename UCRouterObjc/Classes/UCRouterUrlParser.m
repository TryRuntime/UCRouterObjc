//
//  UCRouterUrlParser.m
//  Pods
//
//  Created by Link on 2019/5/3.
//

#import "UCRouterUrlParser.h"
#import "UCRouter.h"

@implementation UCRouterUrlParser

+ (UCRouterInfo *)parseUrl:(NSString *)urlStr params:(NSDictionary<NSString *,NSString *> *)params {
    
    // 先对urlStr解码,再进行一次编码,保证url只编码了一次
    NSString *decodeUrlStr = [[urlStr stringByRemovingPercentEncoding] stringByRemovingPercentEncoding];
    NSString *encodeUrlStr = [decodeUrlStr stringByAddingPercentEncodingWithAllowedCharacters:NSCharacterSet.URLQueryAllowedCharacterSet];
    
    NSURL *url = [[NSURL alloc] initWithString:encodeUrlStr];
    if (url == nil) {return nil;}
    
    // 拼接url
    for (NSString *key in params.allKeys) {
        NSString *value = params[key];
        
        if (url.query == nil) {
            encodeUrlStr = [NSString stringWithFormat:@"%@?%@=%@", encodeUrlStr, key, value];
        } else {
            encodeUrlStr = [NSString stringWithFormat:@"%@&%@=%@", encodeUrlStr, key, value];
        }
        url = [[NSURL alloc] initWithString:encodeUrlStr];
    }

    // 获取注册的urlKey
    NSString *urlPath = url.path.length > 1 ? url.path : @"";
    NSString *routerKey = [NSString stringWithFormat:@"%@%@", url.host, urlPath];

    // 拼接参数
    NSMutableDictionary *decodeParams = [self queryParameters:url];
    for (NSString *key in params.allKeys) {
         // 这里手动传入的key如果与url的key名字有冲突默认直接覆盖!
        decodeParams[key] = params[key];
    }

    // 取出路由存储信息
    UCRouterInfo *routerInfo = UCRouter.shared.routerInfo[routerKey];
    if (routerInfo == nil) {return nil;}
    
    [routerInfo clearUrlInfo];
    [routerInfo setUrlInfo:url.scheme
                      host:url.host
                      path:url.path
                     query:decodeParams
              encodeUrlStr:encodeUrlStr];

    return routerInfo;
}

+ (NSMutableDictionary<NSString *, NSString *> *)queryParameters:(NSURL *)url {
    NSURLComponents *components = [[NSURLComponents alloc] initWithURL:url resolvingAgainstBaseURL:NO];
    NSArray<NSURLQueryItem *> *queryItem = components.queryItems;
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
    for (NSURLQueryItem *item in queryItem) {
        mDict[item.name] = item.value;
    }
    return mDict;
}
@end

@interface UCRouterInfo ()
@property(nonatomic, copy, readwrite) NSString *registUrlStr;
@property(nonatomic, copy, readwrite) UIViewController* (^viewControllerCallBack)(UCRouterInfo *);
@property(nonatomic, copy, readwrite) NSString *urlScheme;
@property(nonatomic, copy, readwrite) NSString *urlHost;
@property(nonatomic, copy, readwrite) NSString *urlPath;
@property(nonatomic, copy, readwrite) NSDictionary<NSString *, NSString *> *urlQuery;
@property(nonatomic, copy, readwrite) NSString *encodeUrlStr;

@end

@implementation UCRouterInfo

- (instancetype)initRegistUrlStr:(NSString *)urlStr viewControllerCallBack:(UIViewController * _Nonnull (^)(UCRouterInfo * _Nonnull))viewControllerCallBack {
    if (self = [super init]) {
        self.registUrlStr = urlStr;
        self.viewControllerCallBack = viewControllerCallBack;
    }
    return self;
}

- (void)clearUrlInfo {
    _urlScheme = nil;
    _urlHost = nil;
    _urlPath = nil;
    _urlQuery = nil;
    _encodeUrlStr = nil;
}

- (void)setUrlInfo:(NSString *)scheme
              host:(NSString *)host
              path:(NSString *)path
             query:(NSDictionary<NSString *,NSString *> *)query
      encodeUrlStr:(NSString *)encodeUrlStr {
    _urlScheme = scheme;
    _urlHost = host;
    _urlPath = path;
    _urlQuery = query;
    _encodeUrlStr = encodeUrlStr;
}
@end
