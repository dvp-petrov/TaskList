//
//  AllTasks.h
//  Test3
//
//  Created by User-23 on 3/19/14.
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Task.h"

@interface AllTasks : NSObject

@property(readonly, nonatomic) NSMutableArray* taskList;

+(id) sharedInstance;
-(void) addTask:(Task*) task;
-(void) removeTask:(Task*) task;
-(void) moveTaskFromIndex:(NSInteger) sourceIndex toIndex:(NSInteger) destinationIndex;

@end
