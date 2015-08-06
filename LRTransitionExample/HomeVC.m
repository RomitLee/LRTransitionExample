//
//  HomeVC.m
//  LRTransitionExample
//
//  Created by RomitLee on 15/8/5.
//  Copyright (c) 2015年 BlueMobi. All rights reserved.
//

#import "HomeVC.h"
#import "FirstViewController.h"
#import "PushViewController.h"
#import "LRTransitioningDelegate.h"
#import "AnimatedOne.h"
#import "AnimatedTwo.h"
#import "LRNAvigationDelegate.h"

#import "PresentViewController.h"




@interface HomeVC ()
@property (nonatomic,strong) LRTransitioningDelegate *transitioningdelegete;
@property (nonatomic,strong) LRNAvigationDelegate *navigationdelegete;
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.transitioningdelegete=[LRTransitioningDelegate new];
    //[self setTransitioningDelegate:self.delegete];
    
    
    LRNAvigationDelegate *delegate=[LRNAvigationDelegate new];
    self.navigationdelegete=delegate;

    self.navigationController.delegate=self.navigationdelegete;
    self.title=@"首页";
    
    
    // Do any additional setup after loading the view from its nib.
}





- (IBAction)click1:(id)sender {
    FirstViewController *vc=[FirstViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}








- (IBAction)push:(id)sender {
    PushViewController *push=[PushViewController new];
    [self.navigationController pushViewController:push animated:YES];
}


- (IBAction)present:(id)sender {
    PresentViewController *vc=[PresentViewController new];
    [vc setTransitioningDelegate:self.transitioningdelegete];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}
- (IBAction)dismiss:(id)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
