//
//  LRNAvigationDelegate.m
//  TransitionTest
//
//  Created by RomitLee on 15/8/2.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "LRNAvigationDelegate.h"
#import "LRTransitioningDelegate.h"
#import "AnimatedOne.h"
#import "AnimatedTwo.h"

@implementation LRNAvigationDelegate

- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController {
    if ([animationController respondsToSelector:@selector(startInteractiveTransition:)]) {
        return (id <UIViewControllerInteractiveTransitioning>)animationController;
    }
    return nil;
}

- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    switch (operation) {
        case UINavigationControllerOperationPush:
            {
              
                AnimatedOne *one=[AnimatedOne new];
                
                return one;
            } 
        case UINavigationControllerOperationPop:{
            AnimatedTwo *one=[AnimatedTwo new];
            return one;
        }

            
            
        default:
            return nil;
    }
}
@end
