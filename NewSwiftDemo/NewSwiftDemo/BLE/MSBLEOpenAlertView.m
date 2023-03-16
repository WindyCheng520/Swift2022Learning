//
//  MSBLEOpenAlertView.m
//  MSBusiness
//
//  Created by midea on 2021/4/1.
//

#import "MSBLEOpenAlertView.h"
#import "MSBusinessBundle.h"
#import <OEMTheme/UILabel+OEMThemes.h>

@interface MSBLEOpenAlertView ()

@property (nonatomic, strong) HGView *contentView;
@property (nonatomic, strong) HGImageView *iconImageView;
@property (nonatomic, strong) HGLabel *titleLabel;
@property (nonatomic, strong) HGButton *deleteButton;

@end

@implementation MSBLEOpenAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGBA_HEX(0x000000, 0.4f);
        self.frame = [UIScreen mainScreen].bounds;
        
        self.contentView = [HGView new];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.layer.cornerRadius = 16;
        self.contentView.layer.masksToBounds = YES;
        [self addSubview:self.contentView];
        
        self.iconImageView = [HGImageView new];
        self.iconImageView.image = MSResourceImage(@"pic_bluetooth");
        [self.contentView addSubview:self.iconImageView];
        
        self.titleLabel = [HGLabel new];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = RGB_HEX(0x000000);
        self.titleLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightMedium];
        self.titleLabel.text = MSResourceString(@"authorization_ble_open_tip");
        [self.contentView addSubview:self.titleLabel];
        
        self.deleteButton = [HGButton new];
        [self.deleteButton setImage:MSResourceImage(@"popup_ic_close") forState:UIControlStateNormal];
        [self.deleteButton addTarget:self action:@selector(clickDeleteButton) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.deleteButton];
        
        [self makeConstraints];
        [self configureOEMTheme];
    }
    return self;
}

- (void)configureOEMTheme{
   // [self configureThemeTag:OEMThemesTag_UIView_Foreground];
    [self.contentView configureThemeTag:OEMThemesTag_UIView_Foreground];
    [self.titleLabel  configure90TranslucentTrait];

    WEAKSELF
    [self registerTraitDidChangeCallback:^{
        [weakSelf setImageView];
    } callImmidiately:YES];
}

-(void)setImageView{
    
    if (OEMThemeIsDarkMode) {
        self.iconImageView.backgroundColor = RGBA_HEX(0xBBBBBB, 0.2f);
        self.iconImageView.image = MSResourceImage(@"pic_bluetooth_dm");
    }else{
        self.iconImageView.backgroundColor = [UIColor clearColor];
        self.iconImageView.image = MSResourceImage(@"pic_bluetooth");
    }
    
}


- (void)makeConstraints {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(270, 270 + 120));
        make.center.equalTo(self);
    }];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.contentView);
        make.height.mas_equalTo(270);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(self.contentView).offset(16);
        make.trailing.equalTo(self.contentView).offset(-16);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(5);
        make.bottom.equalTo(self.contentView).offset(-5);
    }];
    [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(32, 32));
        make.centerX.equalTo(self);
        make.top.equalTo(self.contentView.mas_bottom).offset(32);
    }];
    
}

- (void)clickDeleteButton {
    [self dismiss];
}

- (void)showWithSuperview:(UIView *)superview {
    self.titleLabel.text = MSResourceString(@"authorization_ble_open_tip");
    if (!superview) {
        superview = [UIApplication sharedApplication].keyWindow;
    }
    self.alpha = 0;
    self.deleteButton.alpha = 0;
    self.contentView.alpha = 0;
    self.contentView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    [superview addSubview:self];
    [UIView animateWithDuration:0.3 animations:^{
        self.contentView.transform = CGAffineTransformMakeScale(1, 1);
        self.alpha = 1;
        self.deleteButton.alpha = 1;
        self.contentView.alpha = 1;
    } completion:nil];
}
 
- (void)dismiss {
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
        self.contentView.alpha = 0;
        self.deleteButton.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

@end
