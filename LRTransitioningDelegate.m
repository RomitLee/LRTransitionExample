//
//  LRTransitioningDelegate.m
//  TransitionTest
//
//  Created by RomitLee on 15/8/3.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "LRTransitioningDelegate.h"
#import "AnimatedOne.h"
#import "AnimatedTwo.h"



@implementation LRTransitioningDelegate

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    AnimatedOne *one=[AnimatedOne new];
    return one;
}

-(id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    AnimatedTwo *two=[AnimatedTwo new];
    return two;
}


@end
