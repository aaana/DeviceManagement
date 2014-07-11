//
//  HANDeviceDetailViewController.h
//  H
//
//  Created by sse-34 on 14-7-10.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HANDeviceDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property(nonatomic,strong)NSString *deviceName;
@property(nonatomic,strong)NSString *deviceType;
@property(nonatomic)BOOL deviceStatus;
@end
