//
//  UCModuleAProvider.h
//  UCRouterObjc_Example
//
//  Created by Link on 2019/5/3.
//  Copyright © 2019 Link913. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UCModuleAProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface UCModuleAProvider : NSObject<UCModuleAProtocol>
- (UIViewController *)getModuleAController;
@end

NS_ASSUME_NONNULL_END
