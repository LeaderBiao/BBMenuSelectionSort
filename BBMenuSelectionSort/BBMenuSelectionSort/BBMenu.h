//
//  BBMenu.h
//  BBMenuSelectionSort
//
//  Created by Biao on 16/6/1.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface BBIndexPath : NSObject

@property (nonatomic, assign) NSInteger row; //行
@property (nonatomic, assign) NSInteger column; //列
@property (nonatomic, assign) NSInteger item; //item

- (instancetype)initWithColumn:(NSInteger)column row:(NSInteger)row;

+ (instancetype)indexPathWithColumn:(NSInteger)column row:(NSInteger)row;
+ (instancetype)indexPathWithColumn:(NSInteger)column row:(NSInteger)row item:(NSInteger)item;

@end

#pragma  mark - datasource
@class BBMenu;
@protocol BBSuperMenuDataSource <NSObject>

@required
//每个column有多少行
- (NSInteger)menu:(BBMenu *)menu numberOfRowsInColumn:(NSInteger)column;
//每个column中每行的title
- (NSString *)menu:(BBMenu *)menu titleForRowAtIndexPath:(BBIndexPath *)indexPath;

@optional
//有多少个column，默认为1列
- (NSInteger)numberOfColumnsInMenu:(BBMenu *)menu;
//第column列，没行的image
- (NSString *)menu:(BBMenu *)menu imageNameForRowAtIndexPath:(BBIndexPath *)indexPath;
//detail text
- (NSString *)menu:(BBMenu *)menu detailTextForRowAtIndexPath:(BBIndexPath *)indexPath;
//某列的某行item的数量，如果有，则说明有二级菜单，反之亦然
- (NSInteger)menu:(BBMenu *)menu numberOfItemsInRow:(NSInteger)row inColumn:(NSInteger)column;
//如果有二级菜单，则实现下列协议
//二级菜单的标题
- (NSString *)menu:(BBMenu *)menu titleForItemsInRowAtIndexPath:(BBIndexPath *)indexPath;
//二级菜单的image
- (NSString *)menu:(BBMenu *)menu imageForItemsInRowAtIndexPath:(BBIndexPath *)indexPath;
//二级菜单的detail text
- (NSString *)menu:(BBMenu *)menu detailTextForItemsInRowAtIndexPath:(BBIndexPath *)indexPath;
@end

#pragma mark - delegate
@protocol BBSuperMenuDelegate <NSObject>

@optional
//点击
- (void)menu:(BBMenu *)menu didSelectRowAtIndexPath:(BBIndexPath *)indexPath;

@end

@interface BBMenu : UIView

@property (nonatomic, weak) id<BBSuperMenuDelegate> delegate;
@property (nonatomic, weak) id<BBSuperMenuDataSource> dataSource;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *selectedTextColor;
@property (nonatomic, strong) UIColor *detailTextColor;
@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, strong) UIFont *detailTextFont;
@property (nonatomic, strong) UIColor *separatorColor;
@property (nonatomic, assign) NSInteger fontSize;
//当前选中的列
@property (nonatomic, strong) NSMutableArray *currentSelectedRows;
//当有二级列表的时候，是否调用点击代理方法
@property (nonatomic, assign) BOOL isClickHaveItemValid;

//获取title
- (NSString *)titleForRowAtIndexPath:(BBIndexPath *)indexPath;
//初始化方法
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height;
//菜单切换，选中的indexPath
- (void)selectIndexPath:(BBIndexPath *)indexPath;
//默认选中
- (void)selectDeafultIndexPath;
//数据重载
- (void)reloadData;

@end
