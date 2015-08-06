//
//  NearCollectionCell.m
//  WJContact
//
//  Created by RomitLee on 15/7/28.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "NearCollectionCell.h"



@interface NearCollectionCell()


@end

@implementation NearCollectionCell


- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor=[UIColor yellowColor];
    _distenView.backgroundColor=[UIColor clearColor];
    
    self.headImage.layer.shadowColor = [UIColor blackColor].CGColor;//阴影颜色
    self.headImage.layer.shadowOffset = CGSizeMake(1, 1);//偏移距离
    self.headImage.layer.shadowOpacity = 0.5;//不透明度
    self.headImage.layer.shadowRadius = 2.0;//半径
    
}

-(void)setData:(Thing *)thing
{
    [self.headImage setImage:thing.image];
    
}

@end
