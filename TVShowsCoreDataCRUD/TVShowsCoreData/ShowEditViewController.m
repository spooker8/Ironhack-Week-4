//
//  ShowEditViewController.m
//  TVShowsCoreData
//
//  Created by Marc on 27/05/15.
//  Copyright (c) 2015 Marc. All rights reserved.
//

#import "ShowEditViewController.h"
#import "TVShowsDataManager.h"

@interface ShowEditViewController ()
@property (weak, nonatomic) IBOutlet UITextField *showTitleField;
@property (weak, nonatomic) IBOutlet UITextField *showSeasonsField;

@end

@implementation ShowEditViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    // When the view is loaded we have the self.show property passed in by the segue.
    self.showTitleField.text = self.show.title;
    self.showSeasonsField.text = [NSString stringWithFormat:@"%@",self.show.numberOfSeasons];
}
- (IBAction)actionSave:(id)sender {
    
    // Get information that the user has typed and put it in the show property
    self.show.title = self.showTitleField.text;
    
    // Convert from string to NSNumber
    self.show.numberOfSeasons = @([self.showTitleField.text integerValue]);
    
    // Ask manager to save all the changes
    [[TVShowsDataManager sharedManager] save];
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)actionDelete:(id)sender {
    [[TVShowsDataManager sharedManager] deleteTVShow:self.show];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
