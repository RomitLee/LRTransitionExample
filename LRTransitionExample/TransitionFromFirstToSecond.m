//
//  ransitionFromFirstToSecond.m
//  TransitionExample
//
//  Created by Pete Callaway on 21/07/2013.
//  Copyright (c) 2013 Dative Studios. All rights reserved.
//

#import "TransitionFromFirstToSecond.h"

#import "FirstViewController.h"
#import "SecondViewController.h"

#import "NearCollectionCell.h"


@implementation TransitionFromFirstToSecond

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
//    FirstViewController *fromViewController = (FirstViewController*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    SecondViewController *toViewController = (SecondViewController*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView *containerView = [transitionContext containerView];
    NSTimeInterval duration = [self transitionDuration:transitionContext];

    // Get a snapshot of the thing cell we're transitioning from
    //NearCollectionCell *cell = (NearCollectionCell*)[fromViewController.collectView cellForItemAtIndexPath:self.path];
    
    NearCollectionCell *cell=self.cell;
    UIView *cellImageSnapshot = [cell.headImage snapshotViewAfterScreenUpdates:NO];
    cellImageSnapshot.frame = [containerView convertRect:cell.headImage.frame fromView:cell.headImage.superview];
    cell.headImage.hidden = YES;

    // Setup the initial view states
    toViewController.view.frame = [transitionContext finalFrameForViewController:toViewController];
    toViewController.view.alpha = 0;
    toViewController.imageView.hidden = YES;

    [containerView addSubview:toViewController.view];
    [containerView addSubview:cellImageSnapshot];

    [UIView animateWithDuration:duration animations:^{
        // Fade in the second view controller's view
        toViewController.view.alpha = 1.0;

        // Move the cell snapshot so it's over the second view controller's image view
        CGRect frame = [containerView convertRect:toViewController.imageView.frame fromView:toViewController.view];
        cellImageSnapshot.frame = frame;
    } completion:^(BOOL finished) {
        // Clean up
        toViewController.imageView.hidden = NO;
        cell.hidden = NO;
        cell.headImage.hidden=NO;
        [cellImageSnapshot removeFromSuperview];

        // Declare that we've finished
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 6;
}

@end
