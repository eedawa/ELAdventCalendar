//
//  ELMessageViewController.h
//  ELAdventCalendar
//
//  Created by Elaine Westra on 12/5/15.
//  Copyright © 2015 Elaine Westra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ElCalendarDay.h"

@interface ELMessageViewController : UIViewController

@property (nonatomic, strong) ELCalendarDay *day;

+ (instancetype)viewControllerFromStoryboard;

@end
