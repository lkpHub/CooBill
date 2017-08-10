//
//  GetLoginExpModel.h
//  CooBill
//
//  Created by admin on 2017/8/10.
//  Copyright © 2017年 lkp. All rights reserved.
//

#import "BaseModel.h"

@interface GetLoginExpModel : BaseModel

//获取RSA指数
@property (nonatomic, copy) NSString *exponent;
//RSA模数
@property (nonatomic, copy) NSString *modulus;
//获取随机数
@property (nonatomic, copy) NSString *randomCode;

@end
