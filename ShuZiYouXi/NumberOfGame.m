//
//  NumberOfGame.m
//  ShuZiYouXi
//
//  Created by 李旗 on 15/11/25.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

#import "NumberOfGame.h"
#import "Compare.h"
#import "Radom.h"

@implementation NumberOfGame
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor whiteColor];
//   
//}

+(NSString *)compare_result :(NSString *)comare_result :(int)count_number
{
    
    NSString *label_text;
    if (count_number < 6 )
    {
        if ([comare_result isEqualToString:@"4A0B"])
           label_text = @"恭喜您猜对了!";
        else
           label_text = @"很遗憾，请再猜一次！";
    }
    else if (count_number == 6)
    {
        if ([comare_result isEqualToString:@"4A0B"])
            label_text = @"恭喜您猜对了!";
        else
            label_text = @"对不起，游戏失败！";
    }

    return label_text;
}



@end
