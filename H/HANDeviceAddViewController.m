//
//  HANDeviceAddViewController.m
//  H
//
//  Created by sse-34 on 14-7-12.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "HANDeviceAddViewController.h"
#import "HANDeviceModel.h"
#import "HANDataModel.h"
@interface HANDeviceAddViewController ()

@end

@implementation HANDeviceAddViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configueNavigationBar];
    // Do any additional setup after loading the view.
}

#pragma mark -UI Methods
-(void)configueNavigationBar{
    //修改title
    self.navigationItem.title=@"Add Device";
    //modify right button
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStyleDone target:self action:@selector(didClickAddButton)];
}

-(void)didClickAddButton{
    NSLog(@"Clicked add button");
    NSString *deviceName = self.deviceNameTextField.text;
    NSString *deviceType = self.deviceTypeTextField.text;
    HANDeviceModel *deviceModel = [[HANDeviceModel alloc] initWithDeviceName:deviceName DeviceType:deviceType];
    
    [[HANDataModel shareDataModel] addDevice:deviceModel];
  
    
    // 返回上一级页面
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.deviceNameTextField resignFirstResponder];
    [self.deviceTypeTextField resignFirstResponder];   //textfield lose fix point
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
