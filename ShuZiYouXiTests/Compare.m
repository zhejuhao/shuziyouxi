//
//  Radom.m
//  ShuZiYouXi
//
//  Created by 李旗 on 15/11/26.
//  Copyright (c) 2015年 李旗. All rights reserved.
//

//#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "Compare.h"

@interface Radom : XCTestCase

@end

@implementation Radom

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
- (void)testCompare
{
    NSArray *array1 = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"5",@"6",@"7",@"8", nil];
    NSString *result = [Compare compare_info:array1 :array2];
    XCTAssertTrue([result isEqualToString:@"0A0B"]);
}
- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
