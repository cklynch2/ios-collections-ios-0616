//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)unsortedArray;
-(NSArray *)arrayBySortingArrayDescending:(NSArray *)unsortedArray;
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array;
-(NSArray *)arrayByReversingArray:(NSArray *)array;
-(NSString *)stringInBasicLeetFromString:(NSString *)string;
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)mixedPositivesAndNegativesArray;
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)charactersInLOR;
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array;
-(NSInteger)sumOfIntegersInArray:(NSArray *)integers;
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)singulars;
-(NSDictionary *)countsOfWordsInString:(NSString *)string;
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songsAndArtists;

@end
