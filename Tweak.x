#import <YouTubeHeader/YTPivotBarItemView.h>

// Hide premium banner at the bottom of account page
%hook YTMMusicAppMetadata
- (id)sidePanelPromo { return nil; }
%end

// Hide Upgrade tab bar item at the bottom
%hook YTPivotBarView
- (YTPivotBarItemView *)itemView4 {
    YTPivotBarItemView *view = %orig;
    view.navigationButton.hidden = YES;
    return nil;
}
%end

// Suppress full-screen premium upgrade alert
%hook YTIShowFullscreenInterstitialCommand
- (BOOL)shouldThrottleInterstitial { return YES; }
%end

// Suppress other premium upgrade alert
%hook YTMAppResponder
- (void)presentInterstitialPromoForEvent:(id)event {}
%end

// Whatever this is for, I suppress
%hook YTPromosheetController
- (void)presentPromosheetWithEvent:(id)event {}
%end