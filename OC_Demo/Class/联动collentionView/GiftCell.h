//
//  GiftCell.h
//  OC_Demo
//
//  Created by sll on 2017/7/10.
//  Copyright © 2017年 LUOSU. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SubcategoryModel;
@interface GiftCell : UICollectionViewCell

@property (nonatomic, copy) NSString *cName;
@property (nonatomic, strong) SubcategoryModel *model;


@end
