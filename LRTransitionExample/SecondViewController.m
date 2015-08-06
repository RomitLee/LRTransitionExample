//
//  SecondViewController.m
//  TransitionExample
//
//  Created by Pete Callaway on 21/07/2013.
//  Copyright (c) 2013 Dative Studios. All rights reserved.
//

#import "SecondViewController.h"

#import "FirstViewController.h"
#import "Thing.h"



@interface SecondViewController ()<UINavigationControllerDelegate>


@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactivePopTransition;

@end


@implementation SecondViewController


#pragma mark UIViewController methods

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];


}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.thing.title;
    self.overviewLabel.text = self.thing.overview;
    self.imageView.image = self.thing.image;

}


@end
