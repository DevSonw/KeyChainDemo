//
//  ViewController.m
//  KeyChainDemo
//
//  Created by 倪敏杰 on 12-7-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "UserInfoViewController.h"
#import "MyKeyChainHelper.h"

@implementation ViewController

@synthesize userNameTextField = _userNameTextField;
@synthesize pwdTextField = _pwdTextField;

NSString * const KEY_USERNAME = @"com.company.app.username";  
NSString * const KEY_PASSWORD = @"com.company.app.password";  

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _userNameTextField.text = [MyKeyChainHelper getUserNameWithService:KEY_USERNAME];
    _pwdTextField.text = [MyKeyChainHelper getPasswordWithService:KEY_PASSWORD];
    _isSavePwd = YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)setSavePwdOn:(id)sender
{
    UISwitch *savePwdSwitch = (UISwitch*)sender;
    if ([savePwdSwitch isOn]) 
    {
        _isSavePwd = YES;
        [MyKeyChainHelper deleteWithUserNameService:KEY_USERNAME psaawordService:KEY_PASSWORD];
    }
    else
    {
        _isSavePwd = NO;
        
    }
}

- (IBAction)loginBtnPressed:(id)sender
{
    NSString* userName = _userNameTextField.text;
    NSString* pwd = _pwdTextField.text;
    if (_isSavePwd) 
    {
        [MyKeyChainHelper saveUserName:userName userNameService:KEY_USERNAME psaaword:pwd psaawordService:KEY_PASSWORD];
    }
    
    UserInfoViewController *userInfoController = [[UserInfoViewController alloc] init];
    [self presentModalViewController: userInfoController animated: YES];
    userInfoController.welcomeMessageLabel.text = [NSString stringWithFormat:@"Welcom,%@,your password is %@",userName,pwd];
    [userInfoController release];
}

@end
