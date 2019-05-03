//
//  UCViewController.m
//  UCRouterObjc
//
//  Created by Link913 on 05/03/2019.
//  Copyright (c) 2019 Link913. All rights reserved.
//

#import "UCViewController.h"
#import <UCRouter.h>
#import "UCModuleAProtocol.h"
@interface UCViewController ()

@end

@implementation UCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)jumpUrl:(id)sender {
    [[UCRouter shared] routeUrlStr:@"demo://home/vc?aha=123" navgationType:pushWithAnimation params:@{@"123": @"321"}];
}
- (IBAction)jumpNative:(id)sender {
    id<UCModuleAProtocol> provider = [[UCRouter shared] getProviderWithProtocol:@protocol(UCModuleAProtocol)];
    UIViewController *vc = [provider getModuleAController];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
