//
//  ViewController.h
//  ShuZiYouXi
//
//  Created by 李旗 on 15/11/18.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITextFieldDelegate>
{
    NSArray *m_fieldArray;
    UILabel *m_result_info;
    UILabel *m_word_info;
    int m_count;
    int m_a;
    int m_b;
    UIButton *m_button_confirm;
    NSMutableArray *m_beginArray;
    NSString *m_filtered;
    NSArray *radom_array;
    NSString  * result_text;
}
@property(strong, nonatomic)UITextField *textField1;
@property(strong, nonatomic)UITextField *textField2;
@property(strong, nonatomic)UITextField *textField3;
@property(strong, nonatomic)UITextField *textField4;
@end

