//
//  EntryCell.h
//  
//
//  Created by Mark Evans on 10/16/15.
//
//

#import <UIKit/UIKit.h>

@interface EntryCell : UITableViewCell

@property (nonatomic, strong) Entry *entry;
@property (nonatomic, strong) IBOutlet UILabel *title;

@end
