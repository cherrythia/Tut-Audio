//
//  ViewController.m
//  AudioTut
//
//  Created by Quix Creations Singapore iOS 1 on 31/8/15.
//  Copyright © 2015 Terry Chia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    AVAudioPlayer *avPlayer;            //instance variable
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *stringPath = [[NSBundle mainBundle]pathForResource:@"BLANK SPACE - Taylor Swift (The Sam Willows Cover)" ofType:@"mp3"];
    NSURL *url = [NSURL fileURLWithPath:stringPath];
    
    NSError *error;
    
    avPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
    [avPlayer setNumberOfLoops:0];
    
    [avPlayer setVolume:self.sliderVolumeOutlet.value];
    [NSTimer scheduledTimerWithTimeInterval:.1 target:self selector:@selector(updatemyProgress) userInfo:nil repeats:YES];
}

-(void)updatemyProgress{
    
    float progress = [avPlayer currentTime] / [avPlayer duration];
    
    self.myProgressView.progress = progress;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderVolumeAction:(id)sender {
    
    UISlider *myslider = sender;
    [avPlayer setVolume:myslider.value];
}

- (IBAction)stopButton:(id)sender {
    [avPlayer stop];
    [avPlayer setCurrentTime:0];
}

- (IBAction)playButton:(id)sender {
    [avPlayer play];
}

- (IBAction)pauseButton:(id)sender {
    [avPlayer pause];
}
@end
