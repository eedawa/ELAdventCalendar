//
//  ELCalendarDayCell.m
//  ELAdventCalendar
//
//  Created by Elaine Westra on 11/18/15.
//  Copyright © 2015 Elaine Westra. All rights reserved.
//

#import "ELCalendarDayCell.h"

@interface ELCalendarDayCell ()

@property (weak, nonatomic) IBOutlet UIButton *dayButton;
@property (weak, nonatomic) IBOutlet UIView *circleView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@end

@implementation ELCalendarDayCell

- (void)awakeFromNib{
    
    //Day Button
    [self.dayButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.dayButton setImage:[UIImage imageNamed:@"Tree"] forState:UIControlStateNormal];
    
    //Circle View
    self.circleView.layer.cornerRadius = CGRectGetWidth(self.circleView.frame)/2;
    self.circleView.clipsToBounds = YES;
    
    //Number Label
    self.numberLabel.text = nil;
}

- (void)setupCell{
    
    self.numberLabel.text = self.day.number;
}

- (IBAction)didPressDayButton:(id)sender {
    
    if(self.day.isAvailable == NO){
        return;
    }
    
    if( self.delegate ){
        if( [self.delegate respondsToSelector:@selector(didPressDayButtonFromCalendarDayCell:withCalendarDay:)] ){
            [self.delegate didPressDayButtonFromCalendarDayCell:self withCalendarDay:self.day];
        }
    }
}
@end
