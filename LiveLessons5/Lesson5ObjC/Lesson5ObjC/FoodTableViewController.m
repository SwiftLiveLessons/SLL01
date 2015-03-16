//
//  FoodTableViewController.m
//  Lesson5ObjC
//
//  Created by BJ on 2/20/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

#import "FoodTableViewController.h"
#import "Fruit.h"
#import "Lesson5ObjC-Swift.h"

@interface FoodTableViewController ()
@property (nonatomic, strong) NSArray *fruits;
@property (nonatomic, strong) NSArray *veggies;
@end

@implementation FoodTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Fruit *apple = [[Fruit alloc] initWithName:@"apple" color:@"red" calories:@95];
    Fruit *banana = [[Fruit alloc] initWithName:@"banana" color:@"yellow" calories:@105];
    Fruit *clementine = [[Fruit alloc] initWithName:@"clementine" color:@"orange" calories:@35];
    
    self.fruits = @[apple, banana, clementine];
    
    Veggie *carrots = [[Veggie alloc] initWithName:@"carrots" color:@"orange" calories:70];
    Veggie *broccoli = [[Veggie alloc] initWithName:@"broccoli" color:@"green" calories:30];
    
    self.veggies = @[carrots, broccoli];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (section == 0) ? self.fruits.count : self.veggies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FruitCell" forIndexPath:indexPath];
    
    id item = (indexPath.section == 0) ? self.fruits[indexPath.row] : self.veggies[indexPath.row];
    cell.textLabel.text = [item description];
    
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return (section == 0) ? @"Fruits" : @"Veggies";
}


@end
