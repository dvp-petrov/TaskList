//
//  ViewController.m
//  Test3
//
//  Created by User-23 on 3/19/14.
//  Copyright (c) 2014 IOTrainingCamp. All rights reserved.
//

#import "ViewController.h"
#import "AddTaskViewController.h"
#import "AllTasks.h"
#import "TaskCustomCell.h"

#define kNumberOfSectionsInToDoList 1

static NSString* TaskCustomCellReuseIdentifier = @"TaskCustomCell";

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *toDoListTableView;
@property AllTasks* toDoList;

@end


@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.toDoListTableView registerNib:[UINib nibWithNibName:TaskCustomCellReuseIdentifier bundle:nil] forCellReuseIdentifier:TaskCustomCellReuseIdentifier ];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed:)];
    self.navigationItem.leftBarButtonItem = addButton;
    
    self.toDoList = [AllTasks sharedInstance];
}

-(void)viewWillAppear:(BOOL)animated {
    [self.toDoListTableView reloadData];
}

-(void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [self.toDoListTableView setEditing:editing animated:animated];
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    [self.toDoList moveTaskFromIndex:sourceIndexPath.row toIndex:destinationIndexPath.row];
    [tableView reloadData];
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    Task* taskToRemove = [self.toDoList.taskList objectAtIndex:indexPath.row];
    [self.toDoList removeTask:taskToRemove];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [tableView reloadData];
}

- (void) addButtonPressed:(id) sender {
    AddTaskViewController* addTaskVC = [[AddTaskViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:addTaskVC animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return kNumberOfSectionsInToDoList;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDoList.taskList count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TaskCustomCell* cell = [tableView dequeueReusableCellWithIdentifier:TaskCustomCellReuseIdentifier forIndexPath:indexPath];
    Task* task = [self.toDoList.taskList objectAtIndex:indexPath.row];
    cell.taskName.text = task.taskName;
    if (task.taskChecked) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    Task* task = [self.toDoList.taskList objectAtIndex:indexPath.row];
    [task changeCheckMark];
    [tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
