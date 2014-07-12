//
//  HANRecordModel.h
//  H
//
//  Created by sse-34 on 14-7-12.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HANRecordModel : NSObject<NSCoding,NSCopying>


@property(nonatomic,copy)NSString *deviceName;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *phoneNumber;
@property(nonatomic,readonly)NSDate *borrowDate;//readonly只有get方法
@property(nonatomic,readonly)NSDate *returnDate;

-(id)initWithDeviceName:(NSString *)deviceName
          Name:(NSString *)name
PhoneNumber:(NSString *)phoneNumber;


-(BOOL)isReturn;
-(void)returnDevice;
-(NSString *)borrowDateString;
-(NSString *)returnDateString;
@end
