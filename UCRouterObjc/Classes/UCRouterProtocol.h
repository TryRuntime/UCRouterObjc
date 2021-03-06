//
//  UCRouterProtocol.h
//  Pods
//
//  Created by Link on 2019/5/3.
//

#import <UIKit/UIKit.h>
#import "UCRouterUrlParser.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UCNavgationType) {
    pushWithAnimation = 0,
    presentWithAnimation,
    pushWithNoAnimation,
    presentWithNoAnimation,
};

@protocol UCRouterable <NSObject>
@required
- (void)registerRouter;

@end

@protocol UCRouterUrlFilterable <NSObject>
@required
- (BOOL)shouldOpenRouter:(UCRouterInfo *)routerInfo
      jumpViewController:(UIViewController *)jumpViewController
           navgationType:(UCNavgationType)navgationType;

@end

@protocol UCRouterNavgationable <NSObject>
@required
- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated;
- (void)presentViewController:(UIViewController *)viewControllerToPresent
                     animated: (BOOL)flag
                   completion:(void (^ __nullable)(void))completion;
@end

NS_ASSUME_NONNULL_END
