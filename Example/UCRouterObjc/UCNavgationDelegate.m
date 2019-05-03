//
//  UCNavgationDelegate.m
//  UCRouterObjc_Example
//
//  Created by Link on 2019/5/3.
//  Copyright © 2019 Link913. All rights reserved.
//

#import "UCNavgationDelegate.h"

@implementation UCNavgationDelegate

- (void)presentViewController:(nonnull UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^ _Nullable)(void))completion {
//    [[UIApplication sharedApplication].keyWindow.rootViewController
//     presentViewController:viewControllerToPresent animated:flag completion:completion];
}

- (void)pushViewController:(nonnull UIViewController *)viewController animated:(BOOL)animated {
    UINavigationController *navVC = (UINavigationController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    [navVC pushViewController:viewController animated:animated];
    NSLog(@"🌞🌞🌞🌞🌞🌞🌞");
}

@end
