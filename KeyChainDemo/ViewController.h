//
//  ViewController.h
//  KeyChainDemo
//
//  Created by 倪敏杰 on 12-7-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    BOOL _isSavePwd;
    
    IBOutlet UITextField *_userNameTextField; 
    IBOutlet UITextField *_pwdTextField; 
}

@property(nonatomic, retain) UITextField *userNameTextField;  
@property(nonatomic, retain) UITextField *pwdTextField;  

- (IBAction)setSavePwdOn:(id)sender;
- (IBAction)loginBtnPressed:(id)sender;

@end
