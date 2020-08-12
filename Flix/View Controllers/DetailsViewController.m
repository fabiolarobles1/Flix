//
//  DetailsViewController.m
//  Flix
//
//  Created by Fabiola E. Robles Vega on 6/26/20.
//  Copyright © 2020 Fabiola E. Robles Vega. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import <QuartzCore/QuartzCore.h>

@interface DetailsViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *baseURLString = @"https://image.tmdb.org/t/p/w500";
    NSString *posterURLString = self.movie[@"poster_path"];
    NSString *fullPosterURLString = [baseURLString stringByAppendingString:posterURLString];
    NSURL *posterURL = [NSURL URLWithString:fullPosterURLString];
    
    self.posterView.layer.borderWidth = 2.0f;
    self.posterView.layer.borderColor = [[UIColor whiteColor] CGColor];
    [self.posterView setImageWithURL:posterURL];
    
    //avoiding no backdrop error
    if([self.movie[@"backdrop_path"] isKindOfClass:[NSString class]]){
        NSString *backdropURLString = self.movie[@"backdrop_path"];
        NSString *fullBackdropURLString = [baseURLString stringByAppendingString:backdropURLString];
        NSURL *backdropURL = [NSURL URLWithString:fullBackdropURLString];
        [self.backdropView setImageWithURL:backdropURL];
    }
    
    self.titleLabel.text = self.movie[@"title"];
    self.synopsisLabel.text = self.movie[@"overview"];
    
    [self.titleLabel sizeToFit];
 
    [self.synopsisLabel sizeToFit];
   
    self.scrollView.delegate = self;
    self.scrollView.directionalLockEnabled = YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.scrollView setContentOffset: CGPointMake(0, self.scrollView.contentOffset.y)];
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
