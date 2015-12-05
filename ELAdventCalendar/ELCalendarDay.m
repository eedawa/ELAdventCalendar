//
//  ELCalendarDay.m
//  ELAdventCalendar
//
//  Created by Elaine Westra on 11/18/15.
//  Copyright © 2015 Elaine Westra. All rights reserved.
//

#import "ELCalendarDay.h"


@implementation ELCalendarDay

-(void)setupWithDictionary:(NSDictionary *)dictionary{
    
    self.number = dictionary[@"number"];
    self.message = dictionary[@"message"];
    self.isAvailable = [self isAvailable];
}

- (BOOL)isAvailable{
    
    BOOL isAvailable = NO;
    
    NSDate *currentDate = [NSDate date];
    
    // Extract the current year;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *currentYear = [formatter stringFromDate:currentDate];
    // Specify the advent calendar day for the cell with the current year.
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:[self.number integerValue]]; //set this based on the calendar day for the cell
    [dateComponents setMonth:12];
    [dateComponents setYear:[currentYear integerValue]];
    NSDate *calendarDay = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
    
    // Compare the current date to the cell's advent day.
    NSComparisonResult comparisonResult = [calendarDay compare:currentDate];
    if (comparisonResult == NSOrderedSame || comparisonResult == NSOrderedAscending){
        // Advent day is either equal to or before the current date. Therefore, we can show the hidden contents.
        isAvailable = YES;
    }
    return isAvailable;
}

@end
