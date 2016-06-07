//
//  ViewController.m
//  BBMenuSelectionSort
//
//  Created by Biao on 16/6/1.
//  Copyright © 2016年 Biao. All rights reserved.
//

#import "ViewController.h"
#import "BBMenu.h"

#define BgColor [UIColor colorWithRed:46/255.f green:255/255.f blue:6/255.f alpha:1]

@interface ViewController () <BBSuperMenuDataSource, BBSuperMenuDelegate>

@property (nonatomic, strong) BBMenu *menu;

@property (nonatomic, strong) NSArray *sort;
@property (nonatomic, strong) NSArray *choose;
@property (nonatomic, strong) NSArray *classify;
@property (nonatomic, strong) NSArray *jiachang;
@property (nonatomic, strong) NSArray *difang;
@property (nonatomic, strong) NSArray *tese;
@property (nonatomic, strong) NSArray *rihan;
@property (nonatomic, strong) NSArray *xishi;
@property (nonatomic, strong) NSArray *shaokao;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /**导航栏背景颜色*/
    self.navigationController.navigationBar.barTintColor = BgColor;
    
    
    
    // 数据
    self.classify = @[@"全部", @"新店特惠", @"连锁餐厅", @"家常快餐", @"地方菜", @"特色小吃", @"日韩料理", @"西式快餐", @"烧烤海鲜"];
    self.sort = @[@"排序", @"智能排序", @"销量最高", @"距离最近", @"评分最高", @"起送价最低", @"送餐速度最快"];
    self.choose = @[@"筛选", @"立减优惠", @"预定优惠", @"特价优惠", @"折扣商品", @"进店领券", @"下单返券"];
    self.jiachang = @[@"家常炒菜", @"黄焖J8饭", @"麻辣烫", @"盖饭"];
    self.difang = @[@"地三鲜", @"手撕包菜", @"辣子鸡", @"白切鸡", @"母鸡汤", @"梅菜扣肉"];
    self.tese = @[@"椒盐虾", @"蒜香骨", @"罗汉斋", @"沙茶牛肉", @"赛螃蟹", @"金钩鲍", @"荔枝虾球"];
    self.rihan = @[@"日本豆腐", @"辣白菜炒年糕", @"韩国鱿鱼羹", @"日式芥末子凉面", @"日式麻酱凉面", @"韩式杂拌菜", @"紫菜包饭"];
    self.xishi = @[@"黑胡椒猪排", @"意大利面", @"三明治", @"西冷牛排", @"海鲜意大利面", @"罗宋汤", @"芒果莫斯"];
    self.shaokao = @[@"韭菜", @"娃娃菜", @"鱿鱼", @"秋刀鱼", @"生蚝", @"鸡腿", @"鸡翅", @"茄子"];
    
    _menu = [[BBMenu alloc]initWithOrigin:CGPointMake(0, 64) andHeight:44];
    _menu.delegate = self;
    _menu.dataSource = self;
    [self.view addSubview:_menu];
    
    [_menu selectDeafultIndexPath];
}

- (NSInteger)numberOfColumnsInMenu:(BBMenu *)menu {
    return 3;
}

- (NSInteger)menu:(BBMenu *)menu numberOfRowsInColumn:(NSInteger)column {
    if (column == 0) {
        return self.classify.count;
    }else if(column == 1) {
        return self.sort.count;
    }else {
        return self.choose.count;
    }
}

- (NSString *)menu:(BBMenu *)menu titleForRowAtIndexPath:(BBIndexPath *)indexPath {
    if (indexPath.column == 0) {
        return self.classify[indexPath.row];
    }else if(indexPath.column == 1) {
        return self.sort[indexPath.row];
    }else {
        return self.choose[indexPath.row];
    }
}

- (NSString *)menu:(BBMenu *)menu imageNameForRowAtIndexPath:(BBIndexPath *)indexPath {
    if (indexPath.column == 0 || indexPath.column == 1) {
        return @"baidu";
    }
    return nil;
}

- (NSString *)menu:(BBMenu *)menu imageForItemsInRowAtIndexPath:(BBIndexPath *)indexPath {
    if (indexPath.column == 0 && indexPath.item >= 0) {
        return @"baidu";
    }
    return nil;
}

- (NSString *)menu:(BBMenu *)menu detailTextForRowAtIndexPath:(BBIndexPath *)indexPath {
    if (indexPath.column < 2) {
        return [@(arc4random()%1000) stringValue];
    }
    return nil;
}

- (NSString *)menu:(BBMenu *)menu detailTextForItemsInRowAtIndexPath:(BBIndexPath *)indexPath {
    return [@(arc4random()%1000) stringValue];
}

- (NSInteger)menu:(BBMenu *)menu numberOfItemsInRow:(NSInteger)row inColumn:(NSInteger)column {
    if (column == 0) {
        if (row == 3) {
            return self.jiachang.count;
        }else if (row == 4) {
            return self.difang.count;
        }else if (row == 5) {
            return self.tese.count;
        }else if (row == 6) {
            return self.rihan.count;
        }else if (row == 7) {
            return self.xishi.count;
        }else if (row == 8) {
            return self.shaokao.count;
        }
    }
    return 0;
}

- (NSString *)menu:(BBMenu *)menu titleForItemsInRowAtIndexPath:(BBIndexPath *)indexPath {
    NSInteger row = indexPath.row;
    if (indexPath.column == 0) {
        if (row == 3) {
            return self.jiachang[indexPath.item];
        }else if (row == 4) {
            return self.difang[indexPath.item];
        }else if (row == 5) {
            return self.tese[indexPath.item];
        }else if (row == 6) {
            return self.rihan[indexPath.item];
        }else if (row == 7) {
            return self.xishi[indexPath.item];
        }
        return self.shaokao[indexPath.item];
    }
    return nil;
}

- (void)menu:(BBMenu *)menu didSelectRowAtIndexPath:(BBIndexPath *)indexPath {
    if (indexPath.item >= 0) {
        NSLog(@"点击了 %ld - %ld - %ld 项目",indexPath.column,indexPath.row,indexPath.item);
    }else {
        NSLog(@"点击了 %ld - %ld 项目",indexPath.column,indexPath.row);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
