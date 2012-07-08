//
//  UserInfoViewController.h
//  KeyChainDemo
//
//  Created by 倪敏杰 on 12-7-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInfoViewController : UIViewController
{
    IBOutlet UILabel *_welcomeMessageLabel; 
    
}

@property(nonatomic, retain) UILabel *welcomeMessageLabel; 

- (IBAction)exitBtnPressed:(id)sender;
@end
