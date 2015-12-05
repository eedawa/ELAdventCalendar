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
@property (strong, nonatomic) ELCalendarDay *day;

@end

@implementation ELCalendarDayCell

- (void)awakeFromNib{
    
    //Day Button
    [self.dayButton.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [self.dayButton setImage:[UIImage imageNamed:@"Tree"] forState:UIControlStateNormal];
    
    //Circle View
    self.circleView.layer.cornerRadius = CGRectGetWidth(self.circleView.bounds)/2;
    self.circleView.clipsToBounds = YES;
}

- (void)prepareForReuse{
    
    [super prepareForReuse];
    
    //Number Label
    self.numberLabel.text = nil;
}

- (void)setupCellWithDay:(ELCalendarDay *)day{
    
    self.numberLabel.text = day.number;
    
    self.day = day;
}

- (IBAction)didPressDayButton:(id)sender {
    
    if(!self.day.isAvailable){
        return;
    }
    
    if( self.delegate ){
        if( [self.delegate respondsToSelector:@selector(didPressDayButtonFromCalendarDayCell:withCalendarDay:)] ){
            [self.delegate didPressDayButtonFromCalendarDayCell:self withCalendarDay:self.day];
        }
    }
}
@end
