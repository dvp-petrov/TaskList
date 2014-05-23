//
//  AddTaskViewController.m
//  Test3
//
//  Created by User-23 on 3/19/14.
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//

#import "AddTaskViewController.h"
#import "AllTasks.h"

#define kAddTaskScreenTitle @"Add Task"

@interface AddTaskViewController ()

@property (weak, nonatomic) IBOutlet UITextField *taskToAddName;
@property (weak, nonatomic) IBOutlet UIDatePicker *taskDatePicker;

@end

@implementation AddTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = kAddTaskScreenTitle;
    
    NSLocale *locale = [NSLocale currentLocale];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setLocale:locale];
    self.taskDatePicker.locale = locale;
    self.taskDatePicker.calendar = [locale objectForKey:NSLocaleCalendar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)cancelButton:(id)sender {
    //we have back button for popViewControllerAnimated:
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)addButton:(id)sender {
    Task* taskToAdd = [[Task alloc] initWithName:self.taskToAddName.text andDate:[self.taskDatePicker date]];
    AllTasks* toDoList = [AllTasks sharedInstance];
    [toDoList addTask:taskToAdd];
    if (![Task isStringEmpty:self.taskToAddName.text]) {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

//hiding the keyboard after typing the task name
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
