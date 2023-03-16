//
//  OEMLocationAlertViewController.m
//  MSDevice
//
//  Created by WindyCheng on 2022/3/14.
//

#import "OEMLocationAlertViewController.h"
#import "MSBusinessBundle.h"
#import <OEMTheme/UILabel+OEMThemes.h>
#import <MSBusiness/OEMGlobalUIManager.h>

@interface OEMLocationAlertViewController ()
@property (nonatomic, strong) HGView *backView;          //容器
@property (nonatomic, strong) HGLabel *titleLabel;       //标题

@property (nonatomic, strong) HGImageView *imageView;




@property (nonatomic, strong) HGButton *inputButton;

@property (nonatomic, strong) HGButton *setButton;

@property (nonatomic, copy)NSString *leftButtonTitle;

@property (nonatomic, copy)NSString *rightButtonTitle;

@property (nonatomic, copy)NSString *content;

@end

@implementation OEMLocationAlertViewController

+ (instancetype )alertControllerWithMessage:(NSString *)message{
    OEMLocationAlertViewController *alert = [[OEMLocationAlertViewController alloc] init];
    alert.content = message;
    alert.modalPresentationStyle =  UIModalPresentationOverFullScreen;
    return alert;
}




- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
    [self configSubviews];
    [self makeConstraints];
    [self configureOEMTheme];
}

- (void)configSubviews{
    self.backView = [HGView new];
    self.backView.backgroundColor = RGBA_HEX(0xffffff, 1.0f);
    self.backView.layer.cornerRadius = 20.f;
    [self.view addSubview:self.backView];
    
    
    self.titleLabel = [HGLabel new];
    self.titleLabel.font = kSemiboldFont(16);
    self.titleLabel.textColor = RGB_HEX(0x000000);
    self.titleLabel.text = self.content;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.numberOfLines = 0;
    [self.titleLabel sizeToFit];
    [self.backView addSubview:self.titleLabel];
    
    

    
    self.imageView = [HGImageView new];
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.image = MSResourceImage(@"location_author_pic");
    [self.backView addSubview:self.imageView];
    
    
    self.inputButton = [HGButton new];
    self.inputButton.clipsToBounds = YES;
    self.inputButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.inputButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.inputButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.leftButtonTitle = MSResourceString(@"authorization_alert_cancel"); //  取消    MSResourceString(@"authorization_location_input"); 
    [self.inputButton setTitle:self.leftButtonTitle forState:UIControlStateNormal];
    self.inputButton.backgroundColor = [UIColor clearColor];
    self.inputButton.layer.borderColor = kDarkText.mainColor.CGColor;
    self.inputButton.layer.borderWidth = 1.0;
    self.inputButton.titleEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    self.inputButton.titleLabel.font = kRegularFont(18);
    [self.inputButton setTitleColor:RGB_HEX(0xFFFFFF) forState:UIControlStateNormal];
    self.inputButton.backgroundColor = RGB_HEX(0xFFFFFF);
    [self.inputButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:self.inputButton];
    

    self.setButton = [HGButton new];
    self.setButton.clipsToBounds = YES;
    self.setButton.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.setButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    self.setButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.rightButtonTitle = MSResourceString(@"authorization_to_setting");
    [self.setButton setTitle:self.rightButtonTitle forState:UIControlStateNormal];
    self.setButton.titleEdgeInsets = UIEdgeInsetsMake(5, 10, 5, 10);
    self.setButton.titleLabel.font = kRegularFont(18);
    [self.setButton setTitleColor:RGB_HEX(0xFFFFFF) forState:UIControlStateNormal];
    self.setButton.backgroundColor = kBusiness.brandColor;
    [self.setButton addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.backView addSubview:self.setButton];
    
    
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
    
    
    
    [self.inputButton specialPropertiesForDarkMode:@{
        @(OEMThemesTag_UIButton_TitleThemeColor) : kBusiness.brandColor
    } lightModeProperties:@{
        @(OEMThemesTag_UIButton_TitleThemeColor) : kBusiness.brandColor
    }];
    
    
    [self.inputButton specialPropertiesForDarkMode:@{
        @(OEMThemesTag_UIButton_Background) : kDarkModeLayoutColor.cardBackgroundColor
    } lightModeProperties:@{
        @(OEMThemesTag_UIButton_Background) : kLightModeLayout.cardBackgroundColor
    }];
    
    
    [self.setButton specialPropertiesForDarkMode:@{
        @(OEMThemesTag_UIButton_TitleThemeColor) : RGB_HEX(0xFFFFFF)
    } lightModeProperties:@{
        @(OEMThemesTag_UIButton_TitleThemeColor) : RGB_HEX(0xFFFFFF)
    }];
    
}

- (void)makeConstraints{
    
    CGFloat width = SCREEN_SCALE_WIDTH(320);
    
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(width);
        make.center.centerX.mas_equalTo(self.view);
        make.center.centerY.mas_equalTo(self.view);
    }];
    
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backView).offset(30);
        make.leading.equalTo(self.backView).offset(24);
        make.trailing.equalTo(self.backView).offset(-24);
    }];
    
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
        make.centerX.mas_equalTo(self.backView);
    }];
    
    
    
    CGFloat leftW = (width) * 0.5 - 26;
    CGRect leftLabelTitleSize = [self.leftButtonTitle boundingRectWithSize:CGSizeMake(leftW, 200)
                                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                                attributes:@{NSFontAttributeName:kRegularFont(18)} context:nil];
    CGFloat leftHeiht = leftLabelTitleSize.size.height;
    if (leftHeiht <= 44) {
        leftHeiht = 44;
    }else{
        leftHeiht = leftHeiht + 20;
    }
    
    
    
    CGFloat rightW = (width) * 0.5 - 26;
    CGRect rightLabelTitleSize = [self.rightButtonTitle boundingRectWithSize:CGSizeMake(rightW, 200)
                                                                     options:NSStringDrawingUsesLineFragmentOrigin
                                                                  attributes:@{NSFontAttributeName:kRegularFont(18)} context:nil];
    CGFloat rightHeiht = rightLabelTitleSize.size.height;
    if (rightHeiht <= 44) {
        rightHeiht = 44;
    }else{
        rightHeiht = rightHeiht + 20;
    }
    
    CGFloat commomHeight = MAX(leftHeiht, rightHeiht);
    
    self.inputButton.layer.cornerRadius = commomHeight * 0.5;
    [self.inputButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(30);
        make.leading.mas_equalTo(self.backView.mas_leading).offset(20);
        make.trailing.mas_equalTo(self.backView.mas_centerX).offset(-6);
        make.height.mas_equalTo(commomHeight);
    }];
    
    self.setButton.layer.cornerRadius = commomHeight * 0.5;
    [self.setButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageView.mas_bottom).offset(30);
        make.leading.mas_equalTo(self.backView.mas_centerX).offset(6);
        make.trailing.mas_equalTo(self.backView.mas_trailing).offset(-20);
        make.height.mas_equalTo(commomHeight);
    }];
    
 
    [self.backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.inputButton.mas_bottom).offset(20);
    }];
}


-(void)clickButton:(UIButton*)sender{
    
    [self dismissViewControllerAnimated:NO completion:nil];
    
   if (sender == self.inputButton) {
       safeCallBlock(self.inputBlock);
   }else{
       safeCallBlock(self.setBlock);
   }
   
}



@end
