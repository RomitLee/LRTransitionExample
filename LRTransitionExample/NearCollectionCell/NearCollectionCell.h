//
//  NearCollectionCell.h
//  WJContact
//
//  Created by RomitLee on 15/7/28.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Thing.h"


@interface NearCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIView *distenView;
@property (weak, nonatomic) IBOutlet UILabel *disLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headImage;


-(void)setData:(Thing *)thing;
@end
