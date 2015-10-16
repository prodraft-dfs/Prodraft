//
//  EntryCell.m
//  
//
//  Created by Mark Evans on 10/16/15.
//
//

#import "EntryCell.h"

@implementation EntryCell

- (void)awakeFromNib {
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
}

- (void)setEntry:(Entry *)entry {
    _entry = entry;
    
    if (entry.ContestTitle) {
        self.title.text = entry.ContestTitle;
    }
}

@end
