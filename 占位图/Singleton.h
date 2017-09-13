//
//  Singleton.h
//  占位图
//
//  Created by 胡高广 on 2017/9/13.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import <Foundation/Foundation.h>

#define singleton_Interface(class)  + (class *)share##class;

#define singleton_implemetntion(class)\
static class * instance = nil;\
+ (class *)share##class\
{\
if (!instance) {\
instance = [[class alloc]init];\
}\
return instance;\
}\
+ (class *)allocWithZone:(struct _NSZone *)zone\
{\
static dispatch_once_t onece;\
dispatch_once(&onece, ^{\
instance = [super allocWithZone:zone];\
});\
return instance;\
}
@interface Singleton : NSObject

@end
