//
//  Task.m
//  Test3
//
//  Created by User-23 on 3/19/14.
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//

#import "Task.h"

#define kEmptyString @""

@interface Task ()

@property(nonatomic, readwrite) NSString* taskName;
@property(nonatomic, readwrite) BOOL taskChecked;
@property(nonatomic, readwrite) NSDate* taskDate;

@end


@implementation Task

-(void)setTaskName:(NSString *)taskName {
    if (![Task isStringEmpty:_taskName]) {
        _taskName = taskName;
    }
}

- (id)initWithName:(NSString*) taskName andDate:(NSDate*) taskDate
{
    self = [super init];
    if (self) {
        self.taskName = taskName;
        self.taskChecked = NO;
        self.taskDate = taskDate;
    }
    return self;
}

+(BOOL) isStringEmpty:(NSString*) string {
    if ([string isEqualToString:kEmptyString]) {
        return YES;
    }
    return NO;
}

-(void) changeCheckMark {
    self.taskChecked = !self.taskChecked;
}

@end
