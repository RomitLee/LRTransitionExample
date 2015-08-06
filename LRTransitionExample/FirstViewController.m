//
//  FirstViewController.m
//  TransitionExample
//
//  Created by Pete Callaway on 21/07/2013.
//  Copyright (c) 2013 Dative Studios. All rights reserved.
//

#import "FirstViewController.h"

#import "Thing.h"

#import "SecondViewController.h"
#import "TransitionFromFirstToSecond.h"
#import "NearCollectionCell.h"

@interface FirstViewController ()<UINavigationControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSArray *things;

@end


@implementation FirstViewController



-(void)viewDidLoad
{
    
    
    self.animage=[[TransitionFromFirstToSecond alloc] init];
    
    _things = [Thing exampleThings];
    self.title = @"Things";
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    [flowLayout setItemSize:CGSizeMake( ([UIScreen mainScreen].bounds.size.width-20)/3,([UIScreen mainScreen].bounds.size.width-20)/3)]; //设置每个cell显示数据的宽和高必须
    //[flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal]; //水平滑动
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical]; //控制滑动分页用
    flowLayout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    flowLayout.minimumLineSpacing=5;
    flowLayout.minimumInteritemSpacing=5;
    
    
    UICollectionView *coll=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout];
    //CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)
    //coll.contentInset=UIEdgeInsetsMake(64,0, 0, 0);
    [coll registerNib:[UINib nibWithNibName:@"NearCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"NearCollectionCell"];
    coll.delegate=self;
    coll.dataSource=self;
    coll.backgroundColor=[UIColor yellowColor];
    coll.showsVerticalScrollIndicator=NO;
    
    [self.view addSubview:coll];
}


#pragma mark UIViewController methods

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    // Set outself as the navigation controller's delegate so we're asked for a transitioning object
    self.navigationController.delegate = self;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

     //Stop being the navigation controller's delegate
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}




#pragma mark UINavigationControllerDelegate methods

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    // Check if we're transitioning from this view controller to a SecondViewController
    if (fromVC == self && [toVC isKindOfClass:[SecondViewController class]]) {
        return self.animage;
    }
    else {
        return nil;
    }
}


#pragma mark UICollectionViewControllerDataSource methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.things.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NearCollectionCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"NearCollectionCell" forIndexPath:indexPath];
    if(cell==nil)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"NearCollectionCell" owner:self options:nil]lastObject];
        
    }
    Thing *ting=self.things[indexPath.row];
    [cell setData:ting];
    
    return cell;}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    self.animage.cell=(NearCollectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    
    
    SecondViewController *vc=[SecondViewController new];
    vc.thing = self.things[indexPath.row];
    
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark



@end
