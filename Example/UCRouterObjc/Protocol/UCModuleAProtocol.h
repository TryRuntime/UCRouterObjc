//
//  UCModuleAProtocol.h
//  UCRouterObjc_Example
//
//  Created by Link on 2019/5/3.
//  Copyright © 2019 Link913. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UCRouter.h>

NS_ASSUME_NONNULL_BEGIN

@protocol UCModuleAProtocol <UCRouterable>
- (UIViewController *)getModuleAController;
@end

NS_ASSUME_NONNULL_END
