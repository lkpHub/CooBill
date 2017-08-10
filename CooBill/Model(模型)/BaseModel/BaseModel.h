//
//  BaseModel.h
//  CooBill
//
//  Created by admin on 2017/8/10.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject

//结果码
@property (nonatomic, assign) NSInteger resCode;
//提示信息
@property (nonatomic, copy) NSString *resMsg;

@end
