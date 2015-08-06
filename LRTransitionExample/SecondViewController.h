//
//  SecondViewController.h
//  TransitionExample
//
//  Created by Pete Callaway on 21/07/2013.
//  Copyright (c) 2013 Dative Studios. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
@class Thing;


@interface SecondViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) Thing *thing;


@property (nonatomic, weak) IBOutlet UILabel *overviewLabel;
@end
