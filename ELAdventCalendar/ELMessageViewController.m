//
//  ELMessageViewController.m
//  ELAdventCalendar
//
//  Created by Elaine Westra on 12/5/15.
//  Copyright © 2015 Elaine Westra. All rights reserved.
//

#import "ELMessageViewController.h"

@interface ELMessageViewController ()

@property (weak, nonatomic) IBOutlet UIView *circleView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end

@implementation ELMessageViewController

//==================================================
#pragma mark - Initialize
//==================================================

+ (instancetype)viewControllerFromStoryboard
{
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:@"ELMessageViewController"];
}

//==================================================
#pragma mark - Lifecycle
//==================================================

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setup{
    
    //Circle View
    self.circleView.layer.cornerRadius = CGRectGetWidth(self.circleView.frame)/2;
    self.circleView.clipsToBounds = YES;
    
    self.numberLabel.text = self.day.number;
    self.messageLabel.text = self.day.message;
}

//==================================================
#pragma mark - Actions
//==================================================

- (IBAction)didPressCloseButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 //
                             }];
}


@end
