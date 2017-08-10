//
//  SHBaseHttp.h
//  iOSAPP
//
//  Created by CSH on 16/7/5.
//  Copyright © 2016年 CSH. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  网络基础POST、GET
 */

@interface SHBaseHttp : NSObject

/**
 *   GET请求
 *
 *  @param url      网址
 *  @param param    参数
 *  @param progress 进度
 *  @param success  成功
 *  @param failure  失败
 */
+ (void)getWithRetryNum:(NSInteger)retryNum Url:(NSString *)url param:(NSDictionary *) param progress:(void (^)(NSProgress *progress))progress success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

/**
 *  POST请求
 *
 *  @param retryNum 重试次数
 *  @param url      网址
 *  @param param    参数
 *  @param progress 进度
 *  @param success  成功
 *  @param failure  失败
 */
+ (void)postWithRetryNum:(NSInteger)retryNum Url:(NSString *)url param:(NSDictionary *)param progress:(void (^)(NSProgress *progress))progress success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;

/**
 *  POST文件上传
 *
 *  @param retryNum 重试次数
 *  @param url      网址
 *  @param param    参数
 *  @param fileType 文件类型
 *  @param file     文件路径
 *  @param success  成功
 *  @param failure  失败
 */
+ (void)postUploadFileWithRetryNum:(NSInteger)retryNum Url:(NSString *)url param:(NSDictionary *)param FileType:(NSString *)fileType File:(NSString *)file progress:(void (^)(NSProgress *progress))progress success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;


/**
 文件下载
 
 @param retryNum 重试次数
 @param url      网址
 @param flie     文件路径
 @param progress 进度
 @param success  成功
 @param failure  失败
 */
+ (void)downLoadFlieWithRetryNum:(NSInteger)retryNum Url:(NSString *)url flie:(NSString *)file progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure;

//取消请求
+ (void)cancelAllOperations;

/**
 传入包含transID的请求头参数的POST请求

 @param retryNum 重试次数
 @param url 连接地址
 @param param 参数
 @param header 请求头
 @param progress 进度
 @param success 成功
 @param failure 失败
 */
+ (void)postWithRetryNum:(NSInteger)retryNum Url:(NSString *)url param:(NSDictionary *)param ishaveHeader:(NSString *)header progress:(void (^)(NSProgress *progress))progress success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure;
@end
