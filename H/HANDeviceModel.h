//
//  HANDeviceModel.h
//  H
//
//  Created by sse-34 on 14-7-12.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HANDeviceModel : NSObject<NSCoding,NSCopying>

@property(nonatomic,strong)NSString *deviceName;
@property(nonatomic,strong)NSString *deviceType;
@property(nonatomic)BOOL isBorrowed;
-(id)initWithDeviceName:(NSString *)deviceName
             DeviceType:(NSString *)deviceType;
@end
