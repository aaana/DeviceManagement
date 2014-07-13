//
//  HANRecordDetailViewController.h
//  H
//
//  Created by sse-34 on 14-7-12.
//  Copyright (c) 2014年 tac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HANRecordDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *deviceNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *borrowDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *returnDatelabel;
@property (weak, nonatomic) IBOutlet UIButton *returnButton;
- (IBAction)returnButton:(id)sender;
@property(nonatomic,strong)HANRecordModel *recordModel;
@end
