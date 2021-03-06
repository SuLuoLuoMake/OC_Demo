//
//  ShopCarViewController.m
//  OC_Demo
//
//  Created by sll on 2017/7/12.
//  Copyright © 2017年 LUOSU. All rights reserved.
//

#import "ShopCarViewController.h"
#import "ShopCarCell.h"

#import "JDViewController.h"
@interface ShopCarViewController ()<ShopCarCellDelegate>

@end

@implementation ShopCarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];//给navigationBar设置一个空的背景图片即可实现透明，而且标题按钮都在
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    //其实这个线也是image控制的。设为空即可
    
    //navigationBar是一个复合视图，它是有许多个控件组成的，那么我们就可以从他的内部入手
    [[self.navigationController.navigationBar subviews] objectAtIndex:0].alpha = 0;//这里可以根据scrollView的偏移量来设置alpha就实现了渐变透明的效果
    

   
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *const shopCarID = @"shopCarID";
    
    ShopCarCell  *cell = [tableView dequeueReusableCellWithIdentifier:shopCarID];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ShopCarCell" owner:self options:nil] firstObject];
               [tableView registerNib:[UINib nibWithNibName:@"ShopCarCell" bundle:nil] forCellReuseIdentifier:shopCarID];
    }
    cell.delegate = self;
    cell.carIndexPath = indexPath;
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -- ShopCarCellDelegate
- (void)ShopCarCell:(ShopCarCell *)cell didSlectButtn:(UIButton *)btn indePath:(NSIndexPath *)indexPath{

    [UIApplication sharedApplication].keyWindow.rootViewController = [[JDViewController alloc] init];
    NSLog(@"点击了%ld",indexPath.row);
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
