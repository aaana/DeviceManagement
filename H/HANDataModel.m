//
//  HANDataModel.m
//  H
//
//  Created by sse-34 on 14-7-12.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "HANDataModel.h"
#import "HANRecordModel.h"
#import "HANDeviceModel.h"
static HANDataModel *dataModel=nil;
@implementation HANDataModel

+(HANDataModel *)shareDataModel{
    if(!dataModel){
        dataModel=[[HANDataModel alloc]init];
    }
    return dataModel;
}

-(id)init{
    self=[super init];
    if(self){
        NSString *deviceListPath = [self deviceListPath]; // 获取相应路径
        if ([[NSFileManager defaultManager] fileExistsAtPath:[self deviceListPath]]) { // 检查保存设备信息的文件是否存在
            NSMutableData *deviceData = [[NSMutableData alloc] initWithContentsOfFile:deviceListPath]; // 读取数据
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:deviceData];
            self.deviceArray = [unarchiver decodeObject];
            [unarchiver finishDecoding];
        }
        NSString *recordListPath = [self recordListPath];
        if ([[NSFileManager defaultManager] fileExistsAtPath:[self recordListPath]]) { // 检查保存借记信息的文件是否存在
            NSMutableData *recordData = [[NSMutableData alloc] initWithContentsOfFile:recordListPath];
            NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:recordData];
            self.recordArray = [unarchiver decodeObject];
            [unarchiver finishDecoding];
        }
        
//        [self readDeviceData];
//        [self readRecordData];
    }
    return self;
}





-(void)addDevice:(HANDeviceModel *)deviceModel{
    [self.deviceArray addObject:deviceModel];//加入数组
    //重新排序
    //TODO
    NSLog(@"%@",self.deviceArray);
    [self saveData];//保存
    
    
}//添加设备信息
-(void)addRecord:(HANRecordModel *)recordModel{
    [self.recordArray addObject:recordModel];
    [self.recordArray sortedArrayUsingFunction:sortRecord context:NULL];
     [self saveData];
}//添加借记信息

-(void)deleteDevice:(HANDeviceModel *)deviceModel{
    [self.deviceArray removeObject:deviceModel];
     [self saveData];
}//添加设备信息
-(void)deleteRecord:(HANRecordModel *)recordModel{
    [self.recordArray removeObject:recordModel];
     [self saveData];
}//添加借记信息

-(void)deleteDeviceAtIndex:(NSUInteger)index{
    [self.deviceArray removeObjectAtIndex:index];
     [self saveData];
}
-(void)deleteRecordAtIndex:(NSUInteger)index{
    [self.recordArray removeObjectAtIndex:index];
     [self saveData];
}

-(HANDeviceModel *)getDeviceAtIndex:(NSUInteger)index{
    return [self.deviceArray objectAtIndex:index];
}
-(HANRecordModel *)getRecordAtIndex:(NSUInteger)index{
    return [self.recordArray objectAtIndex:index];
}

-(void)saveData{
    [self saveDeviceData];
    [self saveRecordData];
    
}

-(void)saveDeviceData{
    
    
    NSMutableData *deviceData=[[NSMutableData alloc]init];
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:deviceData];
    [archiver encodeObject:self.deviceArray];
    [archiver finishEncoding];
    [deviceData writeToFile:[self deviceListPath] atomically:YES];
}
//-(void)readDeviceData{
//    NSString *devicelistpath=[self deviceListPath];
//    NSMutableData *deviceData=[[NSMutableData alloc]initWithContentsOfFile:devicelistpath];
//    if (deviceData.length!=0) {
//        NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:deviceData];
//        self.deviceArray=[unarchiver decodeObject];
//        [unarchiver finishDecoding];
//    }
//}
//-(void)readRecordData{
//    NSString *recordlistpath=[self recordListPath];
//    NSMutableData *recordData=[[NSMutableData alloc]initWithContentsOfFile:recordlistpath];
//    if(recordData.length!=0){
//        NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:recordData];
//        self.recordArray=[unarchiver decodeObject];
//        [unarchiver finishDecoding];
//    }
//}
-(void)saveRecordData{
    NSMutableData *recordData=[[NSMutableData alloc]init];
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:recordData];
    [archiver encodeObject:self.recordArray];
    [archiver finishEncoding];
    [recordData writeToFile:[self recordListPath] atomically:YES];
}

- (void)returnDeviceWithRecord:(HANRecordModel *)recordModel {
    [recordModel returnDevice];
    
    for (HANDeviceModel *dm in self.deviceArray) {
        if (dm.deviceIndex == recordModel.deviceIndex) {
            dm.isBorrowed = NO;
            break;
        }
    }
}

#pragma mark Utils
#pragma mark Path

-(NSString *)applicationDocumentsDirectoryPath{
    
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
}


-(NSString *)deviceListPath{
    NSString *rootPath=[self applicationDocumentsDirectoryPath];
    rootPath=[rootPath stringByAppendingPathComponent:@"deviceList.plist"];
    return rootPath;
//    rootPath=[rootPath stringByAppendingString:@"/deviceList.plist"];
}
-(NSString *)recordListPath{
    NSString *rootPath=[self applicationDocumentsDirectoryPath];
    rootPath=[rootPath stringByAppendingPathComponent:@"recordList.plist"];
    return rootPath;
    //    rootPath=[rootPath stringByAppendingString:@"/deviceList.plist"];
}


NSInteger sortRecord(id l, id r, void *context) {
    HANRecordModel *lRecordModel = (HANRecordModel *)l;
    HANRecordModel *rRecordModel = (HANRecordModel *)r;
    
    if ([lRecordModel isReturn]) { // lRecordModel已经归还
        if ([rRecordModel isReturn]) { // rRecordModel已经归还
            return [lRecordModel.returnDate compare:rRecordModel.returnDate]; // 对比两者的大小，以此决定顺序
        } else { // rRecordModel未归还
            return NSOrderedDescending; // 已归还的记录排在后面
        }
    } else { // lRecordModel未归还
        if ([rRecordModel isReturn]) { // rRecordModel已经归还
            return NSOrderedAscending;
        } else { // rRecordModel未归还
            return [lRecordModel.returnDate compare:rRecordModel.returnDate]; // 对比两者的大小，以此决定顺序
        }
    }
}

#pragma mark -Properties
-(NSMutableArray *)deviceArray{
    if (_deviceArray==nil) {
        _deviceArray=[[NSMutableArray alloc]init];
    }
    return _deviceArray;
}
-(NSMutableArray *)recordArray{
    if (_recordArray==nil) {
        _recordArray=[[NSMutableArray alloc]init];
    }
    return _recordArray;
}

@end
