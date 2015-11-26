//
//  Compare.m
//  ShuZiYouXi
//
//  Created by 李旗 on 15/11/25.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "Compare.h"
#import "Radom.h"
@implementation Compare
+(NSString *)compare_info :(NSArray *)arr_random_numbers :(NSArray *)user_filled_numbers
{
    int a_count = 0;
    int b_count = 0;
    for (int j = 0; j < user_filled_numbers.count ; j++)
    {
        for (int m = 0; m < arr_random_numbers.count; m++)
        {
            if ([[user_filled_numbers objectAtIndex:j]isEqualToString:[arr_random_numbers objectAtIndex:m]])
            {
                if (j == m)
                    a_count++;
                else
                    b_count++;
            }
        }
    }
    NSString *result_info = [NSString stringWithFormat:@"%dA%dB",a_count,b_count];
    return result_info;
}


@end
