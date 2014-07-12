//
//  HANDeviceDetailViewController.m
//  H
//
//  Created by sse-34 on 14-7-10.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "HANDeviceDetailViewController.h"

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

#pragma mark -UI Methods
-(void)configueView{
    self.deviceTypeLabel.text=self.deviceType;
    self.deviceNameLabel.text=self.deviceName;
    if(self.deviceStatus){
        self.statusLabel.text=@"Available";
    }else{
        self.statusLabel.text=@"Borrowed";
    }
}

-(void)configueNavigationBar{
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"Borrow"
        style:UIBarButtonItemStyleDone
        target:self
        action:@selector(didClickBorrowButton)];
}

-(void)didClickBorrowButton{
    NSLog(@"name:%@",self.nameTextField.text);
    NSLog(@"phone:%@",self.phoneTextField.text);
    
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
