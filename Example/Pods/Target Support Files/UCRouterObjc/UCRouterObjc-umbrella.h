#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "UCRouter.h"
#import "UCRouterProtocol.h"
#import "UCRouterUrlParser.h"

FOUNDATION_EXPORT double UCRouterObjcVersionNumber;
FOUNDATION_EXPORT const unsigned char UCRouterObjcVersionString[];

