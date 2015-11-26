//
//  Radom.m
//  ShuZiYouXi
//
//  Created by 李旗 on 15/11/25.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "Radom.h"

@implementation Radom

+(NSArray *)randomArray
{
    NSMutableArray *startArray = [[NSMutableArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9", nil];
    NSMutableArray  *resultArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (int i = 0; i < 4; i ++)
    {
        int k = arc4random()%startArray.count;
        resultArray[i] = startArray[k];
        startArray[k] = [startArray lastObject];//为了更好的乱序，交换下位置
        [startArray removeLastObject];
        
    }
    return resultArray;
    
}//生成随机的4个数


@end
