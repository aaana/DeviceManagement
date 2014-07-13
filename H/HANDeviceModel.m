//
//  HANDeviceModel.m
//  H
//
//  Created by sse-34 on 14-7-12.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "HANDeviceModel.h"
#import "HANDataModel.h"
@implementation HANDeviceModel


-(id)initWithDeviceName:(NSString *)deviceName
             DeviceType:(NSString *)deviceType{
    self=[super init];
    if(self){
        self.deviceName=deviceName;
        self.deviceType=deviceType;
        self.isBorrowed=NO;
        self.deviceIndex=[[[HANDataModel shareDataModel]deviceArray]count];
    }
    return self;
}

#pragma mark-NSCoding
-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeInteger:self.deviceIndex forKey:@"deviceIndex"];
    [aCoder encodeObject:self.deviceName forKey:@"deviceName"];
    [aCoder encodeObject:self.deviceType forKey:@"deviceType"];
    [aCoder encodeBool:self.isBorrowed forKey:@"isBorrowed"];
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.deviceName = [aDecoder decodeObjectForKey:@"deviceName"];
        self.deviceType = [aDecoder decodeObjectForKey:@"deviceType"];
        self.isBorrowed = [aDecoder decodeBoolForKey:@"isBorrowed"];
        self.deviceIndex=[aDecoder decodeIntegerForKey:@"deviceIndex"];
    }
    return self;
}

#pragma mark - NSCopying
- (id)copyWithZone:(NSZone *)zone {
    HANDeviceModel *copy = [[[self class] allocWithZone:zone] init];
    
    if (copy) {
        copy.deviceIndex = self.deviceIndex;
        copy.deviceName = [self.deviceName copyWithZone:zone];
        copy.deviceType = self.deviceType;
        copy.isBorrowed = self.isBorrowed;
    }
    
    return copy;
}
@end
