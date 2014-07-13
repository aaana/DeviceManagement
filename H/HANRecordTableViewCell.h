//
//  HANRecordTableViewCell.h
//  H
//
//  Created by sse-34 on 14-7-12.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HANRecordTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *isReturnedLabel;
@property (weak, nonatomic) IBOutlet UILabel *returnDateLabel;
@property(nonatomic,strong)HANRecordModel *recordModel;
@end
