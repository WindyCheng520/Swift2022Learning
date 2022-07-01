//
//  ListItem.m
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/13.
//

#import "ListItem.h"

@implementation ListItem

+(NSArray *)listItemsFromJSONData:(NSData*)jsonData {
    NSArray *itemsDescriptors = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];

    NSMutableArray* items = [NSMutableArray new];
    for (NSDictionary* itemDesc in itemsDescriptors) {
        ListItem* item = [ListItem new];
        item.icon = [UIImage imageNamed:itemDesc[@"icon"]];
        item.title = itemDesc[@"title"];
        item.url = [NSURL URLWithString:itemDesc[@"title"]];
        [items addObject:item];
    }
    return [items copy];
}

@end
