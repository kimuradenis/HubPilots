//
//  SocialViewCell.m
//  HubPilots
//
//  Created by Denis Kimura on 17/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import "SocialViewCell.h"

@implementation SocialViewCell
@synthesize messageLabel;
@synthesize usernameLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
