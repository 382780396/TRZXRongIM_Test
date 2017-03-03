//
//  Target_TRZXRongIM.m
//  RongIM_Test
//
//  Created by 移动微 on 17/2/27.
//  Copyright © 2017年 移动微. All rights reserved.
//

#import "Target_TRZXRongIM.h"
#import <RongIMKit/RongIMKit.h>
//#import "RCDChatListViewController.h"
#import "RCDChatViewController.h"

@implementation Target_TRZXRongIM
// 跳转融云聊天列表 页面
- (UIViewController *)Action_RCDChatListViewController:(NSDictionary *)params{
    Class cls = NSClassFromString([NSString stringWithFormat:@"RCDChatListViewController"]);
    UIViewController *RCDChatList = [cls new];
    NSString *title = params[@"vcTitle"];
    RCDChatList.title = title;
    RCDChatList.navigationItem.title = title;
    
    // TabBar 暂时不设置
//    RCDChatList.tabBarItem.title = title;
//    RCDChatList.tabBarItem.image = [UIImage imageNamed:@"tab4"];
//    RCDChatList.tabBarItem.selectedImage = [UIImage imageNamed:@"tab4sel"];
    return RCDChatList;
}

// 跳转融云聊天页面
- (UIViewController *)Action_RCDChatViewController:(NSDictionary *)params{
    
    NSString *userId = params[@"userId"];
    NSString *vcTitle = params[@"vcTitle"];
    
    RCConversation *conversation = [[RCConversation alloc]init];
    conversation.conversationType = ConversationType_PRIVATE;
    conversation.targetId = userId;
    conversation.conversationTitle = vcTitle;
    
    RCConversationModel *model = [[RCConversationModel alloc]init:RC_CONVERSATION_MODEL_TYPE_NORMAL conversation:conversation extend:nil];
    model.isTop = false;
    model.conversationModelType = RC_CONVERSATION_MODEL_TYPE_NORMAL;
    model.conversationType = ConversationType_PRIVATE;
    model.objectName = @"RC:TxtMsg";
    
    RCDChatViewController *conversationVC = [[RCDChatViewController alloc]init];
    conversationVC.conversationType = model.conversationType;
    conversationVC.targetId = model.targetId;
    conversationVC.userName = model.conversationTitle;
    conversationVC.title = model.conversationTitle;
    conversationVC.conversation = model;
    conversationVC.unReadMessage = model.unreadMessageCount;
    conversationVC.enableNewComingMessageIcon=YES;//开启消息提醒
    conversationVC.enableUnreadMessageIcon=YES;
    if (model.conversationType == ConversationType_SYSTEM) {
        conversationVC.userName = @"系统消息";
        conversationVC.title = @"系统消息";
    }
    conversationVC.isChangeEdgeTopBool = YES;
    return conversationVC;
}

@end
