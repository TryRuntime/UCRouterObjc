# UCRouterObjc

[![CI Status](https://img.shields.io/travis/Link913/UCRouterObjc.svg?style=flat)](https://travis-ci.org/Link913/UCRouterObjc)
[![Version](https://img.shields.io/cocoapods/v/UCRouterObjc.svg?style=flat)](https://cocoapods.org/pods/UCRouterObjc)
[![License](https://img.shields.io/cocoapods/l/UCRouterObjc.svg?style=flat)](https://cocoapods.org/pods/UCRouterObjc)
[![Platform](https://img.shields.io/cocoapods/p/UCRouterObjc.svg?style=flat)](https://cocoapods.org/pods/UCRouterObjc)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

UCRouterObjc is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'UCRouterObjc'
```

## How to use

参考`Example`中的例子

### 功能支持:
- 1.本地跨组件无耦合调用,而且不是`hard code`,是通过协议来完成的.
- 2.注册`URL`之后外部便可以通过`URL`来进行跳转.

### 使用步骤:
- 1.设置导航协议, URL过滤协议在主工程中的代理

    	[[UCRouter shared] setNavgationAndUrlFilter:[UCNavgationDelegate new]
                           	         filterDelegate:[UCURLFilterDelegate new]];
                           	         
- 2.抽取一个协议层,这个协议层各个模块可以去依赖他,协议的实现放在各自的模块里.注意:我们本地`native`的跨组件调用都应该通过协议的方式,而不是通过注册url! 注册和调用可以看一下`ViewController`和`UCModuleAProvider`中的代码.

- 3.Objc其实是有比较好的注册方案的,我们放在`UCModuleAProvider `的`load`方法中,对他的自身进行注册.                      	         

## Author

Link913, fanyang_32012@outlook.com

## License

UCRouterObjc is available under the MIT license. See the LICENSE file for more info.
