//
//  HANDeviceTableViewCell.h
//  H
//
//  Created by sse-34 on 14-7-11.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HANDeviceModel;
@interface HANDeviceTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *deviceStatusLabel;

@property(nonatomic,strong)
HANDeviceModel *deviceModel;
@end
