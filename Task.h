//
//  Task.h
//  Test3
//
//  Created by User-23 on 3/19/14.
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Task : NSObject

@property(nonatomic, readonly) NSString* taskName;
@property(nonatomic, readonly) BOOL taskChecked;
@property(nonatomic, readonly) NSDate* taskDate;

- (id)initWithName:(NSString*) taskName andDate:(NSDate*) taskDate;
+(BOOL) isStringEmpty:(NSString*) string;
-(void) changeCheckMark;

@end
