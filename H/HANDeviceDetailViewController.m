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
    // Do any additional setup after loading the view.
}

-(void)configueView{
    self.deviceTypeLabel.text=self.deviceType;
    self.deviceNameLabel.text=self.deviceName;
    if(self.deviceStatus){
        self.statusLabel.text=@"Avilable";
    }else{
        self.statusLabel.text=@"Borrowed";
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
