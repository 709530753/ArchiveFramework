//
//  ArchiverManager.h
//  ArchiveFramework
//
//  Created by myxc on 2018/8/19.
//  Copyright © 2018 myxc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArchiverManager : NSObject

/**
 归档
 
 @param archiver archiver
 */
- (BOOL)archiver:(id)archiver;

/**
 解档
 */
- (id)uArchieve;

/**
 删除归档文件
 */
- (BOOL)removeArchieve;

@end
