//
//  ViewController.m
//  DoIt
//
//  Created by Marcial Galang on 1/13/14.
//  Copyright (c) 2014 Marc Galang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *items;
    
    __weak IBOutlet UITextField *myTextField;
    
    __weak IBOutlet UITableView *myTableView;
    
    __weak IBOutlet UIButton *editButton;
    
    BOOL isEditingDone;
    
    
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    isEditingDone = YES;
    
    items = [NSMutableArray arrayWithObjects:@"One", @"Two", @"Three", nil];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)tableView:(UITableView *)tableView willBeginEditingRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [[myTableView cellForRowAtIndexPath:indexPath ] setEditing:YES animated:NO];
    
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return items.count;
    
}
- (IBAction)onAddButtonPressed:(id)sender {
    
    [items addObject:myTextField.text];
    [myTableView reloadData];
    
    myTextField.text = @"";
    
    
    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (IBAction)onEditButtonPressed:(id)sender {
//    hasAddButtonBeenPressed = YES;
    
    if (isEditingDone) {
        isEditingDone = NO;
        [editButton setTitle:@"Done" forState:UIControlStateNormal];
        
    } else  {
        isEditingDone = YES;
        [editButton setTitle:@"Edit" forState:UIControlStateNormal];
        
    }
/*
    if (toggleBetweenEditAndAddButton % 2 == 0){
        [editButton setTitle:@"Add" forState:UIControlStateNormal];
        
    } else {
        [editButton setTitle:@"Edit" forState:UIControlStateNormal];
        
    }
 */
    
    
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myReuseIdentifyer"];
    cell.textLabel.text = [items objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [myTableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor greenColor];
    if (!isEditingDone){
        [items removeObjectAtIndex:indexPath.row];
        [myTableView reloadData];
    }
    
    
}
- (void)didReceiveMemoryWarning

{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
