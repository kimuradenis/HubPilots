//
//  MenuModel.m
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import "MenuModel.h"
#import "MenuItem.h"

@implementation MenuModel

-(NSArray *)getMenuItems
{
    NSMutableArray *menuItemArray = [[NSMutableArray alloc] init];
    
    MenuItem *item1 = [[MenuItem alloc]init];
    item1.menuTitle = @"Navegação";
    item1.menuIcon = @"NavMenuIcon";
    item1.screenType = ScreenTypeQuestion;
    [menuItemArray addObject:item1];
    
    MenuItem *item2 = [[MenuItem alloc]init];
    item2.menuTitle = @"Regulamentos";
    item2.menuIcon = @"RegMenuIcon";
    item2.screenType = ScreenTypeRegulamentos;
    [menuItemArray addObject:item2];
    
    MenuItem *item3 = [[MenuItem alloc]init];
    item3.menuTitle = @"Meteorologia";
    item3.menuIcon = @"MetMenuIcon";
    item3.screenType = ScreenTypeMeteoro;
    [menuItemArray addObject:item3];
    
    MenuItem *item4 = [[MenuItem alloc]init];
    item4.menuTitle = @"Conhecimentos Técnicos";
    item4.menuIcon = @"ConMenuIcon";
    item4.screenType = ScreenTypeQuestion;
    [menuItemArray addObject:item4];
    
    MenuItem *item5 = [[MenuItem alloc]init];
    item5.menuTitle = @"Teoria de Voo";
    item5.menuIcon = @"TeoMenuIcon";
    item5.screenType = ScreenTypeQuestion;
    [menuItemArray addObject:item5];
    
    MenuItem *item6 = [[MenuItem alloc]init];
    item6.menuTitle = @"Estatísticas";
    item6.menuIcon = @"StatsMenuIcon";
    item6.screenType = ScreenTypeStats;
    [menuItemArray addObject:item6];
    
    MenuItem *item7 = [[MenuItem alloc]init];
    item7.menuTitle = @"Sobre";
    item7.menuIcon = @"AboutMenuIcon";
    item7.screenType = ScreenTypeAbout;
    [menuItemArray addObject:item7];
    
    MenuItem *item8 = [[MenuItem alloc]init];
    item8.menuTitle = @"Remover Propaganda";
    item8.menuIcon = @"RemoveAdsMenuIcon";
    item8.screenType = ScreenTypeRemoveAds;
    [menuItemArray addObject:item8];
    

    

    
    return menuItemArray;
}

@end
