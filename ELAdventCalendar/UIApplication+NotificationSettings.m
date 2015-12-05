//
//  UIApplication+NotificationSettings.m
//  ELAdventCalendar
//
//  Created by Elaine Westra on 12/5/15.
//  Copyright © 2015 Elaine Westra. All rights reserved.
//

#import "UIApplication+NotificationSettings.h"

@implementation UIApplication (NotificationSettings)

- (void)setupLocalNotifications{
    
    [self cancelAllLocalNotifications];
    
    NSDate *currentDate = [NSDate date];
    // Extract the current year;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy"];
    NSString *currentYear = [formatter stringFromDate:currentDate];
    // Create a notification to fire for each day of December until the 25th of the current year.
    [formatter setDateFormat:@"dd"];
    NSString *currentDay = [formatter stringFromDate:currentDate];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:12];
    [dateComponents setYear:[currentYear integerValue]];
    [dateComponents setHour:21];
    for (NSInteger i=[currentDay integerValue]; i<26; i++) {
        [dateComponents setDay:i]; //set this based on the calendar day for the cell
        NSDate *fireDate = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
        NSInteger daysLeftToChristmas = 25-i;
        UILocalNotification* localNotification = [[UILocalNotification alloc] init];
        localNotification.fireDate = fireDate;
        NSString *messageString = @"It's Christmas!!! Check your advent calendar!";
        if (daysLeftToChristmas > 0){
            messageString =[NSString stringWithFormat:@"%ld days left to Christmas! Check your advent calendar!", (long)daysLeftToChristmas];
        }
        localNotification.alertBody = messageString;
        localNotification.alertAction = @"Hohoho";
        localNotification.timeZone = [NSTimeZone localTimeZone];
        localNotification.applicationIconBadgeNumber = [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
        // Schedule the notification
        [self scheduleLocalNotification:localNotification];

    }
}

@end
