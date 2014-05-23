//
//  AllTasks.m
//  Test3
//
//  Created by User-23 on 3/19/14.
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//

#import "AllTasks.h"

@interface AllTasks ()

@property(readwrite, nonatomic) NSMutableArray* taskList;

@end


@implementation AllTasks

static BOOL isInited = NO;

+(id) sharedInstance {
    static AllTasks* instance = nil;
    if (!instance) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
        instance = [[super alloc] init];
        });
    }
    return instance;
}

- (id)init
{
    if (!isInited) {
        self = [super init];
        if (self) {
            //self.taskList = [[NSMutableArray alloc] init];
        }
        isInited = YES;
    }
    return self;
}

+(id) alloc {
    return [AllTasks sharedInstance];
}

-(id) copy {
    return [AllTasks sharedInstance];
}

-(id) mutableCopy {
    return [AllTasks sharedInstance];
}

-(NSMutableArray *)taskList {
    if (!_taskList) {
        _taskList = [NSMutableArray array];
    }
    return _taskList;
}

-(void) addTask:(Task*) task {
    if (![Task isStringEmpty:task.taskName]) {
        [self.taskList addObject:task];
    }
}

-(void) removeTask:(Task*) task {
    [self.taskList removeObject:task];
}

-(void) moveTaskFromIndex:(NSInteger) sourceIndex toIndex:(NSInteger) destinationIndex {
    Task* task = [self.taskList objectAtIndex:sourceIndex];
    [self removeTask:task];
    [self.taskList insertObject:task atIndex:destinationIndex];
}

//-(BOOL) taskListContainsTask:(Task*) task {
//    if ([self.taskList containsObject:task.taskName]) {
//        return YES;
//    }
//    return NO;
//}

@end
