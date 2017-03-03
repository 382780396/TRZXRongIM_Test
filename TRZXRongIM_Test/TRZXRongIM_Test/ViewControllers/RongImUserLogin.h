//
//  RongImUserLogin.h
//  tourongzhuanjia
//
//  Created by 移动微 on 16/3/15.
//  Copyright © 2016年 JWZhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define RongImUserLoginNotifi @"RongImUserLoginNotifi"

typedef void(^LoginBlock)(BOOL Success);

/**
 *  登录融云
 */
@interface RongImUserLogin : NSObject


/**
 *  创建单例
 *
 *  @return 返回实例对象
 */
+(instancetype)shreadInstance;


+(void)tearDown;

/**
 *  融云用户登录 封装
 */
-(void)userLogin:(LoginBlock)loginBlock;


/**
 *  用户注册 封装
 */
//-(void)userRegister:(LoginBlock)gobackBlock;

//@property(nonatomic,copy)void (^SuccessBLock)(BOOL isSuccess);

// 判断用户是否登录
@property(nonatomic,assign)BOOL isUserLogin;


/**
 *  直接跳转融云聊天界面方法
 *
 *  @param ViewController 传入当前控制器
 *  @param targetId       目标对象id
 */
+(void)jumpRongCloudChatVCWithViewController:(UIViewController *)ViewController TargetId:(NSString *)targetId;




@end
