//
//  OEMBLEAlertViewController.m
//  MSBusiness
//
//  Created by WindyCheng on 2022/3/14.
//

#import "OEMBLEAlertViewController.h"
#import "MSBusinessBundle.h"
#import <OEMTheme/UILabel+OEMThemes.h>
#import <MSBusiness/OEMGlobalUIManager.h>
#import <YYText/YYText.h>

@interface OEMBLEAlertViewController ()

@property (nonatomic, assign) CGSize contentSize;


@property (nonatomic, strong) UIImageView *closeView;         //其它区域关闭

@property (nonatomic, strong) HGView *backView;          //容器
@property (nonatomic, strong) HGLabel *titleLabel;       //标题
@property (nonatomic, strong) HGLabel *contentLabel;     //内容

@property (nonatomic, strong) HGImageView *imageView1;

@property (nonatomic, strong) YYLabel *tipsLabel1;

@property (nonatomic, strong) HGImageView *imageView2;

@property (nonatomic, strong) YYLabel *tipsLabel2;


@property (nonatomic, strong) HGButton *switchButton;

@property (nonatomic, copy)NSString *buttonTitle;



@end

@implementation OEMBLEAlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [self configSubviews];
    [self makeConstraints];
    [self configureOEMTheme];
}


-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.backView.bounds
                                                   byRoundingCorners:UIRectCornerTopLeft  | UIRectCornerTopRight
                                                         cornerRadii:CGSizeMake(20,20)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.backView.bounds;
    maskLayer.path = maskPath.CGPath;
    self.backView.layer.mask = maskLayer;
}

- (void)configSubviews{
    
    self.closeView = [UIImageView new];
    self.closeView.backgroundColor = [UIColor clearColor];
    self.closeView.userInteractionEnabled = YES;
    [self.view addSubview:self.closeView];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self.closeView addGestureRecognizer:singleTap];
    
    
    self.backView = [HGView new];
    self.backView.backgroundColor = RGBA_HEX(0xffffff, 1.0f);
    [self.view addSubview:self.backView];
    
    
    self.titleLabel = [HGLabel new];
    self.titleLabel.font = kSemiboldFont(18);
    self.titleLabel.textColor = RGB_HEX(0x000000);
    self.titleLabel.text = MSResourceString(@"authorization_alert_title_open_ble");
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel sizeToFit];
    [self.backView addSubview:self.titleLabel];
    
    
    
    self.contentLabel = [HGLabel new];
    self.contentLabel.font =  kRegularFont(15);
    self.contentLabel.textColor = RGB_HEX(0x000000);
    self.contentLabel.text = MSResourceString(@"authorization_alert_title2_open_ble_tips");
    self.contentLabel.textAlignment = NSTextAlignmentCenter;
    self.contentLabel.numberOfLines = 0;
    [self.contentLabel sizeToFit];
    [self.backView addSubview:self.contentLabel];
    
    
    self.imageView1 = [HGImageView new];
    self.imageView1.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView1.image = MSResourceImage(@"ble_tips1");
    [self.backView addSubview:self.imageView1];
    

    self.tipsLabel1 = [YYLabel new];
    self.tipsLabel1.font = kMediumFont(15);
    self.tipsLabel1.textColor = RGB_HEX(0x000000);
   // self.tipsLabel1.text = MSResourceString(@"开启应用蓝牙权限,去设置");
    self.tipsLabel1.textAlignment = NSTextAlignmentCenter;
    self.tipsLabel1.numberOfLines = 0;
    self.tipsLabel1.preferredMaxLayoutWidth = SCREEN_WIDTH - 32;
    [self.backView addSubview:self.tipsLabel1];
    
    self.imageView2 = [HGImageView new];
    self.imageView2.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView2.image = MSResourceImage(@"ble_tips2");
    [self.backView addSubview:self.imageView2];
    
    
    self.tipsLabel2 = [YYLabel new];
    self.tipsLabel2.font = kMediumFont(15);
    self.tipsLabel2.textColor = RGB_HEX(0x000000);
  //  self.tipsLabel2.text = MSResourceString(@"在手机控制中心开启蓝牙,去开启");
    self.tipsLabel2.textAlignment = NSTextAlignmentCenter;
    self.tipsLabel2.numberOfLines = 0;
    self.tipsLabel2.preferredMaxLayoutWidth = SCREEN_WIDTH - 32;
    [self.backView addSubview:self.tipsLabel2];
    
    
    self.switchButton = [HGButton new];
    self.switchButton.clipsToBounds = YES;
    self.switchButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.switchButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.switchButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.buttonTitle = MSResourceString(@"authorization_alert_try_ap_connect");
    [self.switchButton setTitle:self.buttonTitle forState:UIControlStateNormal];
    self.switchButton.titleEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    self.switchButton.titleLabel.font = kRegularFont(18);
    [self.switchButton setTitleColor:RGB_HEX(0xFFFFFF) forState:UIControlStateNormal];
    self.switchButton.backgroundColor = kBusiness.brandColor;
    [self.switchButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    self.switchButton.hidden = self.hasNoTryButton;
    [self.backView addSubview:self.switchButton];
    
    [self makeConstraints];
    [self configureOEMTheme];
}

- (void)configureOEMTheme{
  //  [self configureThemeTag:OEMThemesTag_UIView_Background];
    [self.backView configureThemeTag:OEMThemesTag_UIView_Foreground];
    
    [self.titleLabel specialPropertiesForDarkMode:@{
        @(OEMThemesTag_UILabel_TextColor) : kDarkText.mainTextColor
    } lightModeProperties:@{
        @(OEMThemesTag_UILabel_TextColor) : kLightText.mainTextColor
    }];
    
    
    [self.contentLabel specialPropertiesForDarkMode:@{
        @(OEMThemesTag_UILabel_TextColor) : kDarkText.secondColor
    } lightModeProperties:@{
        @(OEMThemesTag_UILabel_TextColor) : kLightText.secondColor
    }];
    
    
    WEAKSELF
    [self registerTraitDidChangeCallback:^{
        [weakSelf refreshUI];
    } callImmidiately:YES];
    
//    [self.tipsLabel2 specialPropertiesForDarkMode:@{
//        @(OEMThemesTag_UILabel_TextColor) : kDarkText.mainTextColor
//    } lightModeProperties:@{
//        @(OEMThemesTag_UILabel_TextColor) : kLightText.mainTextColor
//    }];
    
    [self.switchButton specialPropertiesForDarkMode:@{
        @(OEMThemesTag_UIButton_TitleThemeColor) : RGB_HEX(0xFFFFFF)
    } lightModeProperties:@{
        @(OEMThemesTag_UIButton_TitleThemeColor) : RGB_HEX(0xFFFFFF)
    }];
    
    
    
}

- (void)makeConstraints{
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).offset(25);
        make.leading.equalTo(self.backView).offset(16);
        make.trailing.equalTo(self.backView).offset(-16);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.leading.equalTo(self.backView).offset(16);
        make.trailing.equalTo(self.backView).offset(-16);
    }];
    
    [self.imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(30);
        make.centerX.mas_equalTo(self.backView);
        make.width.mas_equalTo(225);
        make.height.mas_equalTo(101);
    }];
    
    
    [self.tipsLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView1.mas_bottom).offset(20);
        make.leading.equalTo(self.backView).offset(16);
        make.trailing.equalTo(self.backView).offset(-16);
    }];
    
    [self.imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tipsLabel1.mas_bottom).offset(50);
        make.centerX.mas_equalTo(self.backView);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(101);
    }];
    
    [self.tipsLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView2.mas_bottom).offset(20);
        make.leading.equalTo(self.backView).offset(16);
        make.trailing.equalTo(self.backView).offset(-16);
    }];
    
    
    CGFloat w = SCREEN_WIDTH;
    CGRect labelTitleSize = [self.buttonTitle boundingRectWithSize:CGSizeMake(w -32, 100)
                                                           options:NSStringDrawingUsesLineFragmentOrigin
                                                        attributes:@{NSFontAttributeName:kRegularFont(18)} context:nil];
    CGFloat heiht = labelTitleSize.size.height;
    if (heiht <= 44) {
        heiht = 44;
    }else{
        heiht = heiht + 20;
    }
    self.switchButton.layer.cornerRadius = heiht * 0.5;
    [self.switchButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tipsLabel2.mas_bottom).offset(40);
        make.leading.equalTo(self.backView).offset(16);
        make.trailing.equalTo(self.backView).offset(-16);
        make.height.mas_equalTo(heiht);
    }];
 
    if (self.hasNoTryButton) {
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.tipsLabel2.mas_bottom).offset(44);
        }];
    }else{
        [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.switchButton.mas_bottom).offset(44);
        }];
    }

    [self.closeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.view);
        make.trailing.equalTo(self.view);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.backView.mas_top).offset(0);
    }];
}



- (NSMutableAttributedString *)getAttributeNoticeStringWithIndex:(NSInteger)index isAuthorized:(BOOL)authorized  isOpen:(BOOL)open {
    
    BOOL isAuthorized = authorized;
    BOOL isOpen = open;
    
    NSString *title = (index == 0 ?MSResourceString(@"authorization_alert_open_ble_tips1"):MSResourceString(@"authorization_alert_open_ble_tips2"));
    UIColor *color = [UIColor blackColor];
    UIColor *hightLightColor = kBusiness.brandColor;
    if(OEMThemeIsDarkMode){
        color = kDarkText.mainTextColor;
        
        if (index == 0) {
            hightLightColor = isAuthorized?kDarkText.thirdColor:kBusiness.brandColor;
        }else{
            hightLightColor = isOpen?kDarkText.thirdColor:kBusiness.brandColor;
        }
        
        
    }else{
        color = kLightText.mainTextColor;
        if (index == 0) {
            hightLightColor = isAuthorized?kDarkText.thirdColor:kBusiness.brandColor;
        }else{
            hightLightColor = isOpen?kDarkText.thirdColor:kBusiness.brandColor;
        }
    }
    
    NSString *hightLightString = @"";
    
    if (index == 0) {
        hightLightString = isAuthorized?MSResourceString(@"authorization_alert_had_open"): MSResourceString(@"authorization_to_setting");
    }else{
        hightLightString = isOpen?MSResourceString(@""): MSResourceString(@"");
    }
    
   

    NSMutableAttributedString *noticeString = [[NSMutableAttributedString alloc] initWithString:title attributes:@{NSFontAttributeName:kMediumFont(15), NSForegroundColorAttributeName : color}];
    NSMutableAttributedString *openString = [[NSMutableAttributedString alloc] initWithString:hightLightString attributes:@{NSFontAttributeName:kMediumFont(15),NSForegroundColorAttributeName : hightLightColor}];
    @weakify(self)
    [openString yy_setTextHighlightRange:NSMakeRange(0, hightLightString.length)
                                   color:hightLightColor
                         backgroundColor:[UIColor clearColor]
                               tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
        @strongify(self);
        
        if (index == 0) {
            if (!isAuthorized){
                
               // [self dismissViewControllerAnimated:YES completion:^{
                    if (self.setBlock) {
                        self.setBlock();
                    }
               // }];
            }
        }else{
            
            if (!isOpen){
                
                    if (self.openBlock) {
                        self.openBlock();
                    }
            }
            
        }
        
    
    }];
    [noticeString appendAttributedString:openString];
    return noticeString;
}


-(void)clickButton:(UIButton *)sender{
    
    WEAKSELF
    [self dismissViewControllerAnimated:NO completion:^{
        if (weakSelf.switchBlock) {
            weakSelf.switchBlock();
        }
    }];
}

-(void)tap{
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)refreshUI{
    self.tipsLabel1.attributedText = [self getAttributeNoticeStringWithIndex:0 isAuthorized:self.isAuthorized isOpen:self.isOpen];
    self.tipsLabel1.textAlignment = NSTextAlignmentCenter;
    self.tipsLabel1.numberOfLines = 0;
    self.tipsLabel2.attributedText = [self getAttributeNoticeStringWithIndex:1 isAuthorized:self.isAuthorized isOpen:self.isOpen];
    self.tipsLabel2.numberOfLines = 0;
    self.tipsLabel2.textAlignment = NSTextAlignmentCenter;
    
    if (self.isAuthorized && self.isOpen) {
        [self tap];
        return;
    }
    
    if (self.isSwitchBLE){
        if (!self.isAuthorized || !self.isOpen) {
            self.buttonTitle = MSResourceString(@"authorization_alert_cancel");
            [self.switchButton setTitle:self.buttonTitle forState:UIControlStateNormal];
        }else{
            self.buttonTitle = MSResourceString(@"authorization_alert_go_connect");
            [self.switchButton setTitle:self.buttonTitle forState:UIControlStateNormal];
        }
    }
}

@end
