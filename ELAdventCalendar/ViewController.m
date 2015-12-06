//
//  ViewController.m
//  ELAdventCalendar
//
//  Created by Elaine Westra on 11/18/15.
//  Copyright © 2015 Elaine Westra. All rights reserved.
//

#import "ViewController.h"
#import "ELCalendarDataSource.h"
#import "ELCalendarDay.h"
#import "ELCalendarDayCell.h"
#import "ElMessageViewController.h"

#define NUMBER_OF_CELLS_PER_ROW = 5;

@interface ViewController ()

<
UICollectionViewDelegate,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout,
ELCalendarDayCellDelegate
>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *calendarArr;

@end

@implementation ViewController

//==================================================
#pragma mark - Lifecycle
//==================================================

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.calendarArr = [ELCalendarDataSource calendarArr];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//======================================================================
#pragma mark - UICollectionViewDataSource
//======================================================================
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.calendarArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    ELCalendarDay *day = [ELCalendarDay new];
    [day setupWithDictionary:self.calendarArr[indexPath.row]];
    
    NSString* cellIdentifier = @"CalendarDayCell";
    
    ELCalendarDayCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier
                                                                                          forIndexPath:indexPath];
    
    cell.delegate = self;
    
    [cell setupCellWithDay:day];
    
    return cell;
}

- (void)showCellAnimation:(UICollectionViewCell*)cell
{
    //if has already shown intial welcome and intro message cells, do not animate.
//    if (self.day.count > 2){
//        return;
//    }
    
    cell.alpha = 0.5f;
    cell.transform = CGAffineTransformMakeTranslation(0, 100);
    
    [UIView animateWithDuration:0.6f
                          delay:0
         usingSpringWithDamping:0.7f
          initialSpringVelocity:0.0f
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         cell.alpha = 1;
                         cell.transform = CGAffineTransformIdentity;
                     } completion:^(BOOL finished) {
                         
                     }];
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
}

//======================================================================
#pragma mark - UICollectionViewDelegateFlowLayout
//======================================================================
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath{

    CGFloat viewWidth = self.collectionView.bounds.size.width;
    CGFloat viewHeight = self.collectionView.bounds.size.height;
    CGFloat insetPadding = 5*2;
    
    CGFloat cellHeight = (viewHeight - (5 * insetPadding)-10)/5;
    CGFloat cellWidth = (viewWidth - (5 * insetPadding)-10)/5;
    
    return CGSizeMake(cellWidth, cellHeight);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView
                   layout:(UICollectionViewLayout*)collectionViewLayout
minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 5;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

////==================================================
//#pragma mark - Cell Delegate
////==================================================
//
//-(void)didPressEditButtonFromProfilePreviewCell:(ACUProfilePreviewCollectionViewCell*)cell{
//    
//    self.currentIndexPath = cell.indexPath;
//    
//    ACUProfilePreviewMessage *lastMessage = [self.messageArr lastObject];
//    ACUProfileSignUpMessageType lastMessageType = lastMessage.messageType;
//    
//    
//    NSDictionary *selectionInfoDict = @{
//                                        @"messageType": [NSNumber numberWithInteger:cell.message.messageType],
//                                        @"lastMessageType":[NSNumber numberWithInteger:lastMessageType]
//                                        };
//    
//    //Edit Button in Cell Selected Notification
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"ACUProfilePreviewDidPressEditButton"
//                                                        object:self
//                                                      userInfo:selectionInfoDict];
//    self.isEditing = YES;
//}

//======================================================================
#pragma mark - Gesture
//======================================================================

- (void)gestureTapGesture:(id)sender
{
    //Collection View Tapped Notification
    [[NSNotificationCenter defaultCenter] postNotificationName:@"ACUProfilePreviewDidTapCollectionView"
                                                        object:self
                                                      userInfo:nil];
}

//==================================================
#pragma mark - Calendar Day Cell Delegate
//==================================================

- (void)didPressDayButtonFromCalendarDayCell:(ELCalendarDayCell *)cell withCalendarDay:(ELCalendarDay *)day{
    
    ELMessageViewController *vc = [ELMessageViewController viewControllerFromStoryboard];
    vc.day = day;
    [self presentViewController:vc animated:YES completion:^{
        //Do something for has been opened here. (LATER)
    }];
}

@end
