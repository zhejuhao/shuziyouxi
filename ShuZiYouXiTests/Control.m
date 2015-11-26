//
//  Control.m
//  ShuZiYouXi
//
//  Created by 李旗 on 15/11/26.
//  Copyright (c) 2015年 李旗. All rights reserved.
//


#import <XCTest/XCTest.h>
#import "NumberOfGame.h"
@interface Control : XCTestCase

@end

@implementation Control

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}
-(void)testControl
{
    NSString *comare_result = @"4A0B";
    int count = 3;
    NSString *label_text = [NumberOfGame compare_result:comare_result :count];
    XCTAssertTrue ([label_text isEqualToString: @"恭喜您猜对了!"]);
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
