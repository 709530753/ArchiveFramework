//
//  ArchiverManager.m
//  ArchiveFramework
//
//  Created by myxc on 2018/8/19.
//  Copyright © 2018 myxc. All rights reserved.
//

#define FILE_PATH    @"Documents/Archiver"
#define ARCHIVER_KEY @"archiver"

#import "ArchiverManager.h"

@interface ArchiverManager()

@property (nonatomic,copy) NSString *filePath;

@end

@implementation ArchiverManager

- (instancetype)init {
    
    self = [super init];
    if (self) {
        self.filePath = [NSHomeDirectory() stringByAppendingPathComponent:FILE_PATH];
        NSLog(@"filePath:%@", self.filePath);
    }
    return self;
}

- (BOOL)archiver:(id)archiver {
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *keyedArchiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    [keyedArchiver encodeObject:archiver forKey:ARCHIVER_KEY];
    [keyedArchiver finishEncoding];
    BOOL result = [data writeToFile: self.filePath atomically:YES];
    if (result) {
        NSLog(@"归档成功:%@", self.filePath);
        return true;
    }else
    {
        NSLog(@"归档不失败!!!");
        return false;
    }
}
- (id)uArchieve {
    
    NSData *data = [NSData dataWithContentsOfFile: self.filePath];
    NSKeyedUnarchiver *uAchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    id slmArchiver = [uAchiver decodeObjectForKey:ARCHIVER_KEY];
    [uAchiver finishDecoding];
    return slmArchiver;
}

- (BOOL)removeArchieve {
    
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath: self.filePath error:&error];
    if (!error) {
        return true;
    }else{
        return false;
    }
}

@end
