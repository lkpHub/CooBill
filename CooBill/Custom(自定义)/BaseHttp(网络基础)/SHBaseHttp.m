//
//  SHBaseHttp.m
//  iOSAPP
//
//  Created by CSH on 16/7/5.
//  Copyright © 2016年 CSH. All rights reserved.
//

#import "SHBaseHttp.h"

#define TimeOut 30

@implementation SHBaseHttp

static NSMutableArray <NSURLSessionDataTask *>*operationQueueArr;

+ (AFHTTPSessionManager *)getAFHTTPSessionManager:(BOOL)ishaveHeader httpHeader:(NSString *)transdIdheader{

    
    static AFHTTPSessionManager *mgr;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 1.获得请求管理者
        mgr = [AFHTTPSessionManager manager];
        // 2.添加参数
        mgr.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html",@"text/plain", nil];
        
        // 3.支持HTTPS
        mgr.securityPolicy.allowInvalidCertificates = YES;
        mgr.securityPolicy.validatesDomainName = NO;
        
        operationQueueArr = [[NSMutableArray alloc]init];
    });
    
    // 4.设置请求头
    if (ishaveHeader) {
        [mgr.requestSerializer setValue:transdIdheader forHTTPHeaderField:@"transactionId"];
    }
//    [mgr.requestSerializer setValue:[kSHUserDefaults objectForKey:kToken] forHTTPHeaderField:@"token"];
//    [mgr.requestSerializer setValue:[kSHUserDefaults objectForKey:kCid] forHTTPHeaderField:@"cid"];

    return mgr;
}

//GET
+ (void)getWithRetryNum:(NSInteger)retryNum Url:(NSString *)url param:(NSDictionary *)param progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure {
    
    // 发送GET请求
    dispatch_async(dispatch_get_main_queue(), ^{
        
        AFHTTPSessionManager *mgr = [SHBaseHttp getAFHTTPSessionManager:NO httpHeader:nil];
        
        mgr.requestSerializer.timeoutInterval = TimeOut;
        
        NSURLSessionDataTask *task = [mgr GET:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
            if (progress) {
                progress(downloadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //移除队列
            [operationQueueArr removeObject:task];
            
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //移除队列
            [operationQueueArr removeObject:task];
            
            if (retryNum > 0) {
                //重新请求
                [self getWithRetryNum:retryNum-1 Url:url param:param progress:progress success:success failure:failure];
            }else{
                if (failure) {
                    failure(error);
                }
            }
        }];
        //添加队列
        [operationQueueArr addObject:task];
    });
}

//有请求头的post
+ (void)postWithRetryNum:(NSInteger)retryNum Url:(NSString *)url param:(NSDictionary *)param ishaveHeader:(NSString *)header progress:(void (^)(NSProgress *progress))progress success:(void (^)(id responseObj))success failure:(void (^)(NSError *error))failure{
    
    // 发送POST请求
    dispatch_async(dispatch_get_main_queue(), ^{
        
        AFHTTPSessionManager *mgr = [SHBaseHttp getAFHTTPSessionManager:YES httpHeader:header];
        // 设置超时
        mgr.requestSerializer.timeoutInterval = TimeOut;
        
        NSURLSessionDataTask *task = [mgr POST:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
            if (progress) {
                progress(downloadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //移除队列
            [operationQueueArr removeObject:task];
            
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //移除队列
            [operationQueueArr removeObject:task];
            
            if (retryNum > 0) {
                //重新请求
                [self postWithRetryNum:retryNum-1 Url:url param:param progress:progress success:success failure:failure];
            }else{
                if (failure) {
                    failure(error);
                }
            }
        }];
        //添加队列
        [operationQueueArr addObject:task];
    });
}

//POST
+ (void)postWithRetryNum:(NSInteger)retryNum Url:(NSString *)url param:(NSDictionary *)param progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    // 发送POST请求
    dispatch_async(dispatch_get_main_queue(), ^{
        
        AFHTTPSessionManager *mgr = [SHBaseHttp getAFHTTPSessionManager:NO httpHeader:nil];
        // 设置超时
        mgr.requestSerializer.timeoutInterval = TimeOut;
        
        NSURLSessionDataTask *task = [mgr POST:url parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
            if (progress) {
                progress(downloadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //移除队列
            [operationQueueArr removeObject:task];
            
            if (success) {
                success(responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //移除队列
            [operationQueueArr removeObject:task];
            
            if (retryNum > 0) {
                //重新请求
                [self postWithRetryNum:retryNum-1 Url:url param:param progress:progress success:success failure:failure];
            }else{
                if (failure) {
                    failure(error);
                }
            }
        }];
        //添加队列
        [operationQueueArr addObject:task];
    });
}

//文件上传
+ (void)postUploadFileWithRetryNum:(NSInteger)retryNum Url:(NSString *)url param:(NSDictionary *)param FileType:(NSString *)fileType File:(NSString *)file progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    // 发送文件上传
    NSURLSessionDataTask *task = [[SHBaseHttp getAFHTTPSessionManager:NO httpHeader:nil] POST:url parameters:param constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *data = [NSData dataWithContentsOfFile:file];
        if (data) {
             [formData appendPartWithFileData:data name:@"file" fileName:file.lastPathComponent mimeType:fileType];
        }
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
        KPLog(@"文件上传进度：%f",uploadProgress.fractionCompleted);
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //移除队列
        [operationQueueArr removeObject:task];
        
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //移除队列
        [operationQueueArr removeObject:task];
        
        if (retryNum > 0) {
            //重新请求
            [self postUploadFileWithRetryNum:retryNum-1 Url:url param:param FileType:fileType File:file progress:progress success:success failure:failure];
        }else{
            if (failure) {
                failure(error);
            }
        }
    }];
    //添加队列
    [operationQueueArr addObject:task];
}

//文件下载
+ (void)downLoadFlieWithRetryNum:(NSInteger)retryNum Url:(NSString *)url flie:(NSString *)file progress:(void (^)(NSProgress *))progress success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    
    //1.创建会话管理者
    NSURL *fileUrl = [NSURL URLWithString:url];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:fileUrl];
    
    //2.下载文件
    NSURLSessionDownloadTask *task = [[SHBaseHttp getAFHTTPSessionManager:NO httpHeader:nil] downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        
        KPLog(@"文件下载进度：%f",downloadProgress.fractionCompleted);
        if (progress) {
            progress(downloadProgress);
        }
        
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        
        return [NSURL fileURLWithPath:file];
        
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
        if (error) {
            if (retryNum > 0) {
                NSInteger num = retryNum;
                //重新请求
                [self downLoadFlieWithRetryNum:--num Url:url flie:file progress:progress success:success failure:failure];
            }else{
                if (failure) {
                    failure(error);
                }
            }
        }else{
            if (success) {
                success([filePath path]);
            }
        }
    }];
    
    //3.执行Task
    [task resume];
}

+ (void)cancelAllOperations{
    
    for (NSURLSessionDataTask *task in operationQueueArr) {
        //取消请求
        [task cancel];
    }
}

@end
