//
//  UCURLFilterDelegate.m
//  UCRouterObjc_Example
//
//  Created by Link on 2019/5/3.
//  Copyright © 2019 Link913. All rights reserved.
//

#import "UCURLFilterDelegate.h"

@implementation UCURLFilterDelegate

- (BOOL)shouldOpenRouter:(nonnull UCRouterInfo *)routerInfo jumpViewController:(nonnull UIViewController *)jumpViewController navgationType:(UCNavgationType)navgationType {
    if ([routerInfo.urlScheme isEqualToString:@"demo1"]) {
        return NO;
    }
    return YES;
}

@end
