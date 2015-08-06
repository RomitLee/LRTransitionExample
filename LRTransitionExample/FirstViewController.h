//
//  FirstViewController.h
//  TransitionExample
//
//  Created by Pete Callaway on 21/07/2013.
//  Copyright (c) 2013 Dative Studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "TransitionFromFirstToSecond.h"
@class Thing;



@interface FirstViewController : UIViewController


@property (nonatomic,strong) UICollectionView *collectView;

@property (nonatomic,strong) TransitionFromFirstToSecond *animage;


@end
