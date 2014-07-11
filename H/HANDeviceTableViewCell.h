//
//  HANDeviceTableViewCell.h
//  H
//
//  Created by sse-34 on 14-7-11.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HANDeviceTableViewCell : UITableViewCell
@property(nonatomic,strong)NSString *deviceName;
@property(nonatomic,strong)NSString *deviceType;
@property(nonatomic)BOOL deviceStatus;
@property(nonatomic)NSInteger index;


-(id)initWithIndex:(NSInteger)index
          deviceName:(NSString *)name
          deviceType:(NSString *)type
      deviceStatus:(BOOL)status;
@end
