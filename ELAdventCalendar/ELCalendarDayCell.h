//
//  ELCalendarDayCell.h
//  ELAdventCalendar
//
//  Created by Elaine Westra on 11/18/15.
//  Copyright © 2015 Elaine Westra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELCalendarDay.h"

@class ELCalendarDayCell;

@protocol ELCalendarDayCellDelegate <NSObject>

-(void)didPressDayButtonFromCalendarDayCell:(ELCalendarDayCell*)cell withCalendarDay:(ELCalendarDay*)day;

@end

@interface ELCalendarDayCell : UICollectionViewCell

@property(nonatomic,weak) id<ELCalendarDayCellDelegate> delegate;

- (void)setupCellWithDay:(ELCalendarDay*)day;

@end
