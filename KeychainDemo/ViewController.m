//
//  ViewController.m
//  KeychainDemo
//
//  Created by vicki753-mac on 13/11/2017.
//  Copyright © 2017 zhengyi. All rights reserved.
//

#import "ViewController.h"
#import "UUID.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.firstTextfield.tag = 100;
    self.secondTextfield.tag = 200;
    self.thirdTextfield.tag = 300;
    
    self.firstTextfield.text = [UUID getUUID];
    self.secondTextfield.text = [UUID getUserName];
    self.thirdTextfield.text = [UUID getUserPasword];
}

#pragma mark - delegate
#pragma mark - TextfieldDelegate
-(void)textFieldDidEndEditing:(UITextField *)textField{
    if ([textField isEqual:self.firstTextfield]) {
        NSLog(@"----%@", textField.text);
    }else if ([textField isEqual:self.secondTextfield]) {
        NSLog(@"-----%@", textField.text);
    }
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
   
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}


#pragma mark - Event
- (IBAction)saveButton:(UIButton *)sender {
    [UUID setUserName:self.secondTextfield.text];
    [UUID setPasswordName:self.thirdTextfield.text];
    
}


- (IBAction)showButton:(UIButton *)sender {
    self.firstTextfield.text = [UUID getUUID];
    self.secondTextfield.text = [UUID getUserName];
    self.thirdTextfield.text = [UUID getUserPasword];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
