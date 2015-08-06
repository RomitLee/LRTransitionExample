//
//  TransitionFromFirstToSecond.h
//  TransitionExample
//
//  Created by Pete Callaway on 21/07/2013.
//  Copyright (c) 2013 Dative Studios. All rights reserved.
//
#import "NearCollectionCell.h"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface TransitionFromFirstToSecond : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic,strong) NSIndexPath *path;
@property (nonatomic,strong) NearCollectionCell *cell;

@end
