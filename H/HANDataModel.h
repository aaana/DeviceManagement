
//  HANDataModel.h

//
//  Created by sse-34 on 14-7-12.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import <Foundation/Foundation.h>

@class HANDeviceModel,HANRecordModel;


@interface HANDataModel : NSObject

+(HANDataModel *)shareDataModel; //class Method
@property(nonatomic,strong) NSMutableArray *deviceArray;//存放设备信息
@property(nonatomic,strong) NSMutableArray *recordArray;//存放借记信息


-(void)addDevice:(HANDeviceModel *)deviceModel;//添加设备信息
-(void)addRecord:(HANRecordModel *)recordModel;//添加借记信息

-(void)deleteDevice:(HANDeviceModel *)deviceModel;//添加设备信息
-(void)deleteRecord:(HANRecordModel *)recordModel;//添加借记信息

-(void)deleteDeviceAtIndex:(NSUInteger)index;
-(void)deleteRecordAtIndex:(NSUInteger)index;

-(HANDeviceModel *)getDeviceAtIndex:(NSUInteger)index;
-(HANRecordModel *)getRecordAtIndex:(NSUInteger)index;

-(void)saveData;


@end
