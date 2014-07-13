//
//  HANDeviceDetailViewController.m
//  H
//
//  Created by sse-34 on 14-7-10.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "HANDeviceDetailViewController.h"
#import "HANDeviceModel.h"
#import "HANRecordModel.h"
@interface HANDeviceDetailViewController ()

@end

@implementation HANDeviceDetailViewController

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
    [self configueView];
    [self configueNavigationBar];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self configueNavigationBar];
}

#pragma mark -UI Methods
-(void)configueView{
    self.deviceTypeLabel.text=self.deviceModel.deviceType;
    self.deviceNameLabel.text=self.deviceModel.deviceName;
    if(self.deviceModel.isBorrowed){
        self.statusLabel.text=@"Borrowed";
        [self.nameTextField setEnabled:NO];
        [self.phoneTextField setEnabled:NO];
    }else{
        self.statusLabel.text=@"Available";
    }
}

-(void)configueNavigationBar{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Borrow"
        style:UIBarButtonItemStyleDone
        target:self
        action:@selector(didClickBorrowButton)];
    if (self.deviceModel.isBorrowed) {
//        self.navigationItem.rightBarButtonItem =nil;
        [self.navigationItem.rightBarButtonItem setEnabled:NO];
    }

    

}

-(void)didClickBorrowButton{
    NSLog(@"name:%@",self.nameTextField.text);
    NSLog(@"phone:%@",self.phoneTextField.text);
    NSString *deviceName=self.deviceNameLabel.text;
    NSString *name=self.nameTextField.text;
    NSString *phone=self.phoneTextField.text;
    HANRecordModel *recordModel=[[HANRecordModel alloc]initWithDeviceName:deviceName Name:name PhoneNumber:phone DeviceIndex:self.deviceModel.deviceIndex];
     [[HANDataModel shareDataModel] addRecord:recordModel];
//    [[HANDataModel shareDataModel]deleteDevice:self.deviceModel];
    self.deviceModel.isBorrowed = YES;
//    [[HANDataModel shareDataModel]addDevice:self.deviceModel];
    [self configueNavigationBar];
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [self.nameTextField resignFirstResponder];
    [self.phoneTextField resignFirstResponder];   //textfield lose fix point
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
