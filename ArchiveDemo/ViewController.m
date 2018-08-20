//
//  ViewController.m
//  ArchiveDemo
//
//  Created by myxc on 2018/8/19.
//  Copyright © 2018 myxc. All rights reserved.
//

#import "ViewController.h"
#import "ArchiveFramework.h"
#import "ZHArchiveEntity.h"

@interface ViewController (){
    
    ArchiverManager *_manager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ZHArchiveEntity *entity = [ZHArchiveEntity new];
    entity.userId = @"1234556790";
    entity.userToken = @"0987654321";
    
     _manager = [ArchiverManager new];

    [_manager archiver:entity];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    ZHArchiveEntity *entity = [_manager uArchieve];
    
    NSLog(@"userId : %@ \n userToken : %@",entity.userId,entity.userToken);
    
}

@end
