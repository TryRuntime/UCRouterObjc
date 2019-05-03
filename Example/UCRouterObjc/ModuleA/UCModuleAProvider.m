//
//  UCModuleAProvider.m
//  UCRouterObjc_Example
//
//  Created by Link on 2019/5/3.
//  Copyright © 2019 Link913. All rights reserved.
//

#import "UCModuleAProvider.h"
#import "UCModuleAVC.h"

@implementation UCModuleAProvider

+ (void)load {
    [[UCRouter shared] registProtocolAndProvider:@protocol(UCModuleAProtocol) provider:[UCModuleAProvider new]];
}

- (UIViewController *)getModuleAController {
    return [UCModuleAVC new];
}

- (void)registerRouter {
    
    [[UCRouter shared] registWithUrlStr:@"home/vc" viewControllerCallBack:^UIViewController * _Nonnull(UCRouterInfo * _Nonnull routerInfo) {
        
        NSLog(@"%@, %@", routerInfo.encodeUrlStr, routerInfo.urlHost);
        return [UCModuleAVC new];
    }];
}

@end
