# 添加红点


可以选择在tabbar上添加红点 或者 数字
大99的 数字 显示。+

NSInteger index = [self.tabBarController.tabBar.items indexOfObject:self.tabBarItem];
if(type == kCustomBadgeStyleNone){
type = kCustomBadgeStyleNumber;
}else if(type  == kCustomBadgeStyleNumber){
if(number == 100){
number = 1;
}else if(number == 1){
number = 10;
}else if(number == 10){
number = 100;
type = kCustomBadgeStyleRedDot;
}
}else if(type == kCustomBadgeStyleRedDot){
type = kCustomBadgeStyleNone;
}
[self.tabBarController.tabBar setBadgeStyle:type value:number atIndex:index];
