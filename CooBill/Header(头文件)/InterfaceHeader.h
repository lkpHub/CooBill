//
//  InterfaceHeader.h
//  CooBIll
//
//  Created by admin on 2017/7/19.
//
//

#ifndef InterfaceHeader_h
#define InterfaceHeader_h


#endif /* InterfaceHeader_h */

//api地址
#define BaseUrl @"https://coobilltest.cootel.com"

//#define BaseUrl @"https://172.18.5.6"

//#define BaseUrl @"https://coobill.cootel.com.kh"

//#define BaseUrl @"https://172.18.3.110"

//公共接口
#pragma mark 登陆接口
#define GetRandCode @"coobill_ip/cooBillAccess!getRandCode.do"

#pragma mark mqtt登陆接口
#define LoginCooBill_mqttNew @"coobill_ip/cooBillAccess!loginCooBill_mqttNew.do"

#pragma mark OperationDeliver接口
#define OperationDeliver @"coobill_ip/cooBillAccess!operationDeliver.do"

#pragma mark Demand请求接口
#define OperationQuery @"coobill_ip/cooBillAccess!operationQuery.do"




#pragma mark 获取支付方式列表
#define RequestPayMethod @"coobillbankgateway/requestPayMethod.do"

#pragma mark 申请公私钥和随机数
#define QueryBalance @"coobillbankgateway/queryBalance.do"

#pragma mark 申请公私钥和随机数
#define GenerateRandom @"coobillbankgateway/generateRandom.do"

#pragma mark 初始化支付请求
#define InitialiseTransaction @"coobillbankgateway/initialiseTransaction.do"

#pragma mark 初始化支付请求
#define IdentifyUser @"coobillbankgateway/identifyUser.do"

#pragma mark 重新发送验证码
#define ResendMsgCode @"coobillbankgateway/resendMsgCode.do"

#pragma mark 确认提交转账
#define VerifyTransfer @"coobillbankgateway/verifyTransfer.do"
