//
//  ViewController.m
//  ShuZiYouXi
//
//  Created by 李旗 on 15/11/18.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"
#import "Radom.h"
#import "NumberOfGame.h"
#import "Compare.h"
@interface ViewController ()

@end

@implementation ViewController

-(UITextField *)creat_textField : (CGRect)frame
{
    UITextField *text_field = [[UITextField alloc]initWithFrame:frame];
    text_field.backgroundColor = [UIColor whiteColor];
    text_field.borderStyle = UITextBorderStyleRoundedRect;
    text_field.clearsOnBeginEditing = YES;
    text_field.keyboardType = UIKeyboardTypeNumberPad ;
    text_field.delegate = self;
    text_field.layer.borderColor = [[UIColor blackColor]CGColor];
    text_field.layer.borderWidth = 1.0;
    text_field.layer.cornerRadius = 5.0;
    [self.view addSubview:text_field];
    return text_field;
    
}

-(void)CreatTextField
{
    self.textField1 = [self creat_textField:CGRectMake(self.view.frame.size.width/6, self.view.frame.size.height/3, self.view.frame.size.width/7, self.view.frame.size.height/15)];
    self.textField2 = [self creat_textField:CGRectMake(self.view.frame.size.width/3, self.view.frame.size.height/3, self.view.frame.size.width/7, self.view.frame.size.height/15)];
    self.textField3 = [self creat_textField:CGRectMake(self.view.frame.size.width/2, self.view.frame.size.height/3, self.view.frame.size.width/7, self.view.frame.size.height/15)];
    self.textField4 = [self creat_textField:CGRectMake(self.view.frame.size.width/1.5, self.view.frame.size.height/3, self.view.frame.size.width/7, self.view.frame.size.height/15)];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self CreatTextField];
    [self.textField1 becomeFirstResponder];
    [self creat_button];
    radom_array = [Radom randomArray];
}


- (UIButton *)create_button_with_title : (NSString *)title :(CGRect)frame :  (SEL)btnPressed
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:btnPressed forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = 10.0;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 1.0;
    [self.view addSubview: button];
    return button;
}

-(void)creat_button
{
    m_button_confirm =  [self create_button_with_title:@"确定" :CGRectMake(self.view.frame.size.width/3, self.view.frame.size.height/5, self.view.frame.size.width/3, self.view.frame.size.height/15): @selector(buttonPressedConfirm:)];
        [m_button_confirm setEnabled:NO];
    [self create_button_with_title:@"重新开始" :CGRectMake(self.view.frame.size.width/3, self.view.frame.size.height/10, self.view.frame.size.width/3, self.view.frame.size.height/15) :@selector(buttonPressedStart:)];
}//创建按钮

-(void)buttonPressedConfirm:(id)sender
{
    [self result_label];
//    result_text =  [Compare compare_info:radom_array :m_fieldArray];
    self.textField1.text = @"";
    self.textField2.text = @"";
    self.textField3.text = @"";
    self.textField4.text = @"";
    m_count++;
    [self.textField1 becomeFirstResponder];
}//点确定时产生的动作
-(void)buttonPressedStart:(id)sender
{
    self.textField1.text = @"";
    self.textField2.text = @"";
    self.textField3.text = @"";
    self.textField4.text = @"";
    m_result_info.text= @"";
    [Radom randomArray];
    [self.textField1 becomeFirstResponder];
}//重新开始产生的动作




//
//-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//
//    if (range.location >= 1)
//        return NO;
//    return YES;
//    
//    //限制输入长度为1

//}
-(void)begin_array
{
    m_fieldArray = [[NSArray alloc]initWithObjects:self.textField1.text,self.textField2.text,self.textField3.text,self.textField4.text, nil];
    m_beginArray = [[NSMutableArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    NSMutableArray *restArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (int  m= 0; m < m_fieldArray.count; m ++)
    {
        for (int n = 0; n < m_beginArray.count ;n++)
        {
            if ([[m_fieldArray objectAtIndex:m ] isEqualToString:[m_beginArray objectAtIndex:n]])
            {
                [restArray addObject:[m_beginArray objectAtIndex:n]];
            }
            
        }
    }
    [m_beginArray removeObjectsInArray:restArray];
}


-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    [self begin_array];
    NSString *numbers = [m_beginArray componentsJoinedByString:@""];
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:numbers]invertedSet];
    m_filtered = [[string componentsSeparatedByCharactersInSet:cs]componentsJoinedByString:@""];
    BOOL canChange = [string isEqualToString:m_filtered];
    return canChange;
    
    
}//限制输入的字符    一开始时0-9  比如输入1  限制输入的就会变为0，2-9



- (void)textFieldDidBeginEditing:(UITextField *)textField;
{
    [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
}
//在开始编辑textField时发送通知



-(void)textFieldDidChange:(UITextField *)textField
{
    if ([ self.textField1 isEqual: textField]||[ self.textField2 isEqual: textField]||[ self.textField3 isEqual: textField]||[ self.textField4 isEqual: textField])
    {
        if (textField.text.length > 1)
        {
            textField.text = [textField.text substringToIndex:1];
        }
    }//限制输入的字数为1
    
    if (![self.textField1.text  isEqual: @""]&&![self.textField2.text  isEqual: @""]&&![self.textField3.text  isEqual: @""]&&![self.textField4.text  isEqual: @""])
    {
        [m_button_confirm setEnabled:YES];
    }//四个textfield不为空的时候才能点击确定

}




-(void)result_label
{
    m_fieldArray = [[NSArray alloc]initWithObjects:self.textField1.text,self.textField2.text,self.textField3.text,self.textField4.text, nil];
    m_result_info=[self creat_label:CGRectMake(self.view.frame.size.width/2.5, self.view.frame.size.height/2, self.view.frame.size.width/2, self.view.frame.size.height/15)];
    m_word_info = [self creat_label:CGRectMake(self.view.frame.size.width/3.5, self.view.frame.size.height/1.8, self.view.frame.size.width, self.view.frame.size.height/15)];
    result_text =  [Compare compare_info:radom_array :m_fieldArray];
    m_result_info.text = result_text;
    m_word_info.text =  [NumberOfGame compare_result:result_text :m_count];
}

-(UILabel *)creat_label:(CGRect)frame
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.font = [UIFont boldSystemFontOfSize:20];
    label.textColor = [UIColor redColor];
    label.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:label];
    return label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

@end
