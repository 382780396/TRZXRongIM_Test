//
//  BPView.m
//  tourongzhuanjia
//
//  Created by 移动微 on 16/3/31.
//  Copyright © 2016年 JWZhang. All rights reserved.
//

#import "IMBPView.h"
#import "RCDCommonDefine.h"

@interface IMBPView()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *DeliverButton;
@property (weak, nonatomic) IBOutlet UILabel *DeliverLabel;

@end

@implementation IMBPView

-(void)awakeFromNib{
    [super awakeFromNib];
    self.headImageView.RC_cornerRadius = 6;
    self.DeliverButton.tag = DeliverButtonTag1;
}

// BP相关注释
//-(void)setBPInfo:(InvestorsBPInfo *)BPInfo{
//    _BPInfo = BPInfo;
//    
//    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:BPInfo.targetPhoto] placeholderImage:[UIImage imageNamed:@"首页头像"]];
//    
//    switch (BPInfo.type) {
//        case 0:{// 0=投资人申请BP，1=股东投递BP
//            [_DeliverLabel setText:@"申请"];
//            //            self.DeliverButton.titleLabel.text = @"申请";
//            self.DeliverButton.tag = DeliverButtonTag2;
//            self.titleLabel.text = @"是否向对方申请项目BP？";
//        }
//            break;
//        case 1:{// 0=投资人申请BP，1=股东投递BP
//            [_DeliverLabel setText:@"投递"];
//            //            self.DeliverButton.titleLabel.text = @"投递";
//            self.DeliverButton.tag = DeliverButtonTag3;
//            self.titleLabel.text = @"是否向对方投递项目BP？";
//        }
//            break;
//            
//        default:
//            break;
//    }
//    
////    if ([BPInfo.userId isEqualToString:[KPOUserDefaults userId]]) {
////        
////        //    ChatUserTypeUser = 0,//User("普通用户"),
////        //    ChatUserTypeExpert  ,//Expert("专家"),
////        //    ChatUserTypeInvestor,//Investor("投资人"),
////        //    ChatUserTypeOrgInvestor,//OrgInvestor("机构投资人"),
////        //    ChatUserTypeShare,//Share("股东"),
////        //    ChatUserTypeTradingCenter,//TradingCenter("交易中心用户"),
////        //    ChatUserTypeGov,//Gov("政府用户"),
////        //    ChatUserTypeBrokerage,//Brokerage("券商用户");
////        
////        if ([BPInfo.userType isEqualToString:@"OrgInvestor"]) {
////            [_DeliverLabel setText:@"申请"];
//////            self.DeliverButton.titleLabel.text = @"申请";
////            self.DeliverButton.tag = DeliverButtonTag2;
////            self.titleLabel.text = @"是否向对方申请项目BP？";
////        }
////        
////        if ([BPInfo.userType isEqualToString:@"Share"]) {
////            [_DeliverLabel setText:@"投递"];
////            self.DeliverButton.tag = DeliverButtonTag3;
////            self.titleLabel.text = @"是否向对方投递项目BP？";
////        }
////        
////    }else{
//    
////        if ([BPInfo.targetUserType isEqualToString:@"OrgInvestor"]) {
////            [_DeliverLabel setText:@"申请"];
////            self.DeliverButton.tag = DeliverButtonTag2;
////            self.titleLabel.text = @"是否向对方申请项目BP？";
////        }
////        
////        if ([BPInfo.targetUserType isEqualToString:@"Share"]) {
////            [_DeliverLabel setText:@"投递"];
//////            self.DeliverButton.titleLabel.text = @"投递";
////            self.DeliverButton.tag = DeliverButtonTag3;
////            self.titleLabel.text = @"是否向对方投递项目BP？";
////        }
////        
////    }
//    
////    switch (BPInfo.type.intValue) {
////        case 0:{
////            self.DeliverButton.titleLabel.text = @"申请";
////            self.DeliverButton.tag = DeliverButtonTag2;
////            self.titleLabel.text = @"是否向对方申请项目BP？";
////        }
////            break;
////        case 1:{
////            self.DeliverButton.titleLabel.text = @"投递";
////            self.DeliverButton.tag = DeliverButtonTag3;
////            self.titleLabel.text = @"是否向对方投递项目BP？";
////        }
////            break;
////        default:
////            break;
////    }
//    
//    
//}

-(void)SharedBP:(UIImage *)photo{
    
//    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:photoStr] placeholderImage:[UIImage imageNamed:@"首页头像"]];
    self.headImageView.image = photo;
    
    [_DeliverLabel setText:@"投递"];
    //            self.DeliverButton.titleLabel.text = @"投递";
    self.DeliverButton.tag = DeliverButtonTag3;
    self.titleLabel.text = @"是否向对方投递项目BP？";
}

-(void)applyBp:(NSString *)photoUrl{
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:photoUrl] placeholderImage:[UIImage imageNamed:@"展位图"]];
    [_DeliverLabel setText:@"申请"];
    //            self.DeliverButton.titleLabel.text = @"申请";
    self.DeliverButton.tag = DeliverButtonTag2;
    self.titleLabel.text = @"是否向对方申请项目BP？";
}

- (IBAction)deliverClick:(id)sender {
    [self removeAnimation:nil];
    if (self.DeliverButtonBlock) {
        self.DeliverButtonBlock(sender);
    }
}

- (IBAction)cancelClick:(id)sender {
    
    
    [self removeAnimation:sender];
}

//移除动画
-(void)removeAnimation:(UIButton *)button{

//    [UIView animateWithDuration:0.2 animations:^{
//        self.y = -94;
//    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    
//    }];
    
    if (self.cancelButtonBlock) {
        self.cancelButtonBlock(button);
    }
}


@end
