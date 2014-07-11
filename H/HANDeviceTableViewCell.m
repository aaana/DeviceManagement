//
//  HANDeviceTableViewCell.m
//  H
//
//  Created by sse-34 on 14-7-11.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import "HANDeviceTableViewCell.h"

@implementation HANDeviceTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

-(id)initWithIndex:(NSInteger)index
        deviceName:(NSString *)name
        deviceType:(NSString *)type
      deviceStatus:(BOOL)status{
    self=[super init];
    if(self){
        self.index=index;
        self.deviceName=name;
        self.deviceType=type;
        self.deviceStatus=status;
        
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
