//
//  ELCalendarDay.h
//  ELAdventCalendar
//
//  Created by Elaine Westra on 11/18/15.
//  Copyright © 2015 Elaine Westra. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELCalendarDay : NSObject

@property (nonatomic, strong) NSString *number;
@property (nonatomic, strong) NSString *message;
@property (nonatomic) BOOL isAvailable;

- (void)setupWithDictionary:(NSDictionary*)dictionary;

@end
