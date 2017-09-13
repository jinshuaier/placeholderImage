//
//  FileManager.h
//  占位图
//
//  Created by 胡高广 on 2017/9/13.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"

@interface FileManager : NSObject
singleton_Interface(FileManager)
@property (nonatomic,assign) int netState;
@end
