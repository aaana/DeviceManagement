//
//  HANDeviceTableViewController.m
//  H
//
//  Created by sse-34 on 14-7-10.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "HANDeviceTableViewController.h"
#import "HANDeviceDetailViewController.h"
#import "HANDeviceAddViewController.h"
#import "HANDeviceModel.h"
#import "HANRecordTableViewController.h"
#import "HANDeviceTableViewCell.h"
@interface HANDeviceTableViewController ()
@property (nonatomic) NSInteger cellCount;
@end

@implementation HANDeviceTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //UI Methods
    [self configureNavigationBar];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}

#pragma mark -UI Methods
-(void)configureNavigationBar{
    //为navigationBar添加右侧按钮
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(didClickAddButton)];
    
}
#
-(void)didClickAddButton{
//    self.cellCount++;
//    [self.tableView reloadData];
    HANDeviceAddViewController *vc=[self.storyboard instantiateViewControllerWithIdentifier:@"DeviceAddViewController"];
    [self.navigationController pushViewController:vc animated:YES];//页面跳转
    
    
    
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
    return [[[HANDataModel shareDataModel] deviceArray] count];
//    return self.cellButton;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    HANDeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DeviceCell" forIndexPath:indexPath];
    cell.deviceModel=[[HANDataModel shareDataModel]getDeviceAtIndex:indexPath.row];
    cell.deviceNameLabel.text=cell.deviceModel.deviceName;
    
    if (cell.deviceModel.isBorrowed) {
      cell.deviceStatusLabel.text=@"Borrowed";
    } else {
        cell.deviceStatusLabel.text=@"Available";
    }
    
    return cell;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    HANDeviceDetailViewController *deviceDetailViewController=segue.destinationViewController;
    deviceDetailViewController.deviceModel=((HANDeviceTableViewCell *)sender).deviceModel;
    
//    deviceDetailViewController.deviceName=@"iPad #2";
//    deviceDetailViewController.deviceType=@"iPad";
//    deviceDetailViewController.deviceStatus=false;
    
        // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
