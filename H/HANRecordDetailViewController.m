//
//  HANRecordDetailViewController.m
//  H
//
//  Created by sse-34 on 14-7-12.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "HANRecordDetailViewController.h"
#import "HANRecordModel.h"
@interface HANRecordDetailViewController ()

@end

@implementation HANRecordDetailViewController

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
    // Do any additional setup after loading the view.
    
    [self configueView];
}

-(void)configueView{

    self.deviceNameLabel.text=self.recordModel.deviceName;
    self.nameLabel.text=self.recordModel.name;
    self.phoneLabel.text=self.recordModel.phoneNumber;
    self.returnDatelabel.text=self.recordModel.returnDateString;
    self.borrowDateLabel.text=self.recordModel.borrowDateString;
    if ([self.recordModel isReturn]) {
//        [self.returnButton setHidden:YES];
        [self.returnButton setEnabled:NO];
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

- (IBAction)returnButton:(id)sender {
//    [[HANDataModel shareDataModel]deleteRecord:self.recordModel];
    [self.recordModel returnDevice];
//    [[HANDataModel shareDataModel]addRecord:self.recordModel];
    [self configueView];
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
@end
