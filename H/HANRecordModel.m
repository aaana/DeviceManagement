//
//  HANRecordModel.m
//  H
//
//  Created by sse-34 on 14-7-12.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "HANRecordModel.h"
@implementation HANRecordModel
#pragma mark - init

-(id)initWithDeviceName:(NSString *)deviceName
                   Name:(NSString *)name
            PhoneNumber:(NSString *)phoneNumber
            DeviceIndex:(NSInteger)deviceIndex

               {
    self = [super init];
    if (self) {
        self.name = name;
        self.phoneNumber = phoneNumber;
        self.deviceName = deviceName;
        self.deviceIndex = deviceIndex;

        _borrowDate = [NSDate date]; // 记录时间
        _returnDate = nil; // 因为借的时候并未归还，所以将returnDate设为nil
    }
    return self;
}


- (void)returnDevice {
    if (![self isReturn]) { // 判断设备是否归还
        // 如未归还，则将其归还
        _returnDate = [NSDate date];
        [[HANDataModel shareDataModel]saveData];

        
        // 更改相应的设备信息
        // TODO
    }
}

- (BOOL)isReturn {
    return _returnDate != nil;
}

- (NSString *)borrowDateString {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [format stringFromDate:self.borrowDate];
}

- (NSString *)returnDateString {
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    return [format stringFromDate:self.returnDate];
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.phoneNumber forKey:@"phoneNumber"];
    [aCoder encodeObject:self.deviceName forKey:@"deviceName"];
    [aCoder encodeObject:self.borrowDate forKey:@"borrowDate"];
    [aCoder encodeObject:self.returnDate forKey:@"returnDate"];
    [aCoder encodeInteger:self.deviceIndex forKey:@"deviceIndex"];

    
}
- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.phoneNumber = [aDecoder decodeObjectForKey:@"phoneNumber"];
        self.deviceName = [aDecoder decodeObjectForKey:@"deviceName"];
        self.deviceIndex = [aDecoder decodeIntegerForKey:@"deviceIndex"];
        _borrowDate = [aDecoder decodeObjectForKey:@"borrowDate"];
        _returnDate = [aDecoder decodeObjectForKey:@"returnDate"];

    }
    return self;
}
#pragma mark-NSCopying
-(id)copyWithZone:(NSZone *)zone{
    HANRecordModel *copy=[[[self class]allocWithZone:zone]init];
    if (copy) {
        copy.name=[self.name copyWithZone:zone];
        copy.deviceName=[self.deviceName copyWithZone:zone];
        copy.phoneNumber=[self.phoneNumber copyWithZone:zone];
        copy.deviceIndex = self.deviceIndex;
        
        copy->_borrowDate=[self.borrowDate copyWithZone:zone];
        copy->_returnDate=[self.returnDate copyWithZone:zone];

    }
    return copy;
}


@end
