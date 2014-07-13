//
//  HANRecordTableViewController.m
//  H
//
//  Created by sse-34 on 14-7-10.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "HANRecordTableViewController.h"
#import "HANRecordTableViewCell.h"
#import "HANRecordModel.h"
#import "HANRecordDetailViewController.h"
#import "HANDeviceModel.h"
@interface HANRecordTableViewController ()

@end

@implementation HANRecordTableViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    }

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
//    return [[[HANrecordModel shareDataModel] recordArray] count];
    return [[[HANDataModel shareDataModel]recordArray]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HANRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RecordCell" forIndexPath:indexPath];
    cell.recordModel=[[HANDataModel shareDataModel]getRecordAtIndex:indexPath.row];

    cell.deviceNameLabel.text=cell.recordModel.deviceName;
          
        
        if ([cell.recordModel isReturn]) {
            cell.isReturnedLabel.text=@"Returned";
            cell.returnDateLabel.text=cell.recordModel.returnDateString;

        } else {
            cell.isReturnedLabel.text=@"Unreturned";
        }
        
        return cell;
    }

    // Configure the cell...

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    HANRecordDetailViewController *recordDetailViewController=segue.destinationViewController;
    recordDetailViewController.recordModel=((HANRecordTableViewCell *)sender).recordModel;
    
}
@end
