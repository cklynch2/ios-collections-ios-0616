//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)unsortedArray
{
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedArrayAsc = [unsortedArray sortedArrayUsingDescriptors:@[sortAsc]];
    return sortedArrayAsc;
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)unsortedArray
{
    NSSortDescriptor *sortDesc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO];
    NSArray *sortedArrayDesc = [unsortedArray sortedArrayUsingDescriptors:@[sortDesc]];
    return sortedArrayDesc;
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array
{
// 1. Capture first and last objects in local variables. Note: The value type has to be the same for all entries in the array, and you have to know what it is!
    NSString *firstObject = array[0];
    NSString *lastObject = array[[array count] - 1];
// 2. Make a mutable copy of the argument array, in order to swap things around.
    NSMutableArray *arraySwapFirstAndLast = [array mutableCopy];
// 3. Remove the first object and replace it with the last.
    [arraySwapFirstAndLast removeObjectAtIndex:0];
    [arraySwapFirstAndLast insertObject:lastObject atIndex:0];
// 4. Remove the last object and replace it with the first.
    [arraySwapFirstAndLast removeObjectAtIndex:[array count]-1];
    [arraySwapFirstAndLast addObject:firstObject];
    return arraySwapFirstAndLast;
}

-(NSArray *)arrayByReversingArray:(NSArray *)array
{
    NSMutableArray *reversedArray = [array mutableCopy];
    for (NSUInteger i = 0; i < [array count]; i++){
        NSString *frontObject = array[i];
        NSString *backObject = array[[array count]-(i+1)];
        [reversedArray replaceObjectAtIndex:i withObject:backObject];
        [reversedArray replaceObjectAtIndex:[array count]-(i+1) withObject:frontObject];
    }
    return reversedArray;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)string
{
// 1. Create a dictionary with the leet translations... ie key(letter) : value(number).
    NSDictionary *leetTranslations = @{@"a" : @"4",
                                       @"s" : @"5",
                                       @"i" : @"1",
                                       @"l" : @"1",
                                       @"e" : @"3",
                                       @"t" : @"7"};
// 2. Iterate over the dictionary in a for-in loop, to replace letters with their corresponding leet translations in a mutable copy of the argument string.
    NSString *leetTranslationOfString = [string mutableCopy];
    for (NSString *letter in leetTranslations){
        NSString *number = leetTranslations[letter];
        leetTranslationOfString = [leetTranslationOfString stringByReplacingOccurrencesOfString:letter withString:number];
    }
    return leetTranslationOfString;
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)mixedPositivesAndNegativesArray
{
    NSMutableArray *sortedPositivesAndNegativesArray = [[NSMutableArray alloc]init];
    NSMutableArray *positiveArray = [[NSMutableArray alloc]init];
    NSMutableArray *negativeArray = [[NSMutableArray alloc]init];
    
    for (NSNumber *integer in mixedPositivesAndNegativesArray){
        if ([integer integerValue] >= 0) {
            [positiveArray addObject:integer];
        }
        else {
            [negativeArray addObject:integer];
        }
    }
    [sortedPositivesAndNegativesArray addObject:negativeArray];
    [sortedPositivesAndNegativesArray addObject:positiveArray];
    return sortedPositivesAndNegativesArray;
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)charactersInLOR
{
    NSMutableArray *namesOfHobbits = [[NSMutableArray alloc]init];
    for (NSString *character in charactersInLOR) {
        if ([charactersInLOR[character] isEqualToString:@"hobbit"]) {
            [namesOfHobbits addObject:character];
        }
    }
    return namesOfHobbits;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array
{
    NSPredicate *hasPrefixA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[cd] 'a'"];
    NSArray *stringsBeginningWithA = [array filteredArrayUsingPredicate:hasPrefixA];
    return stringsBeginningWithA;
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)integers
{
    NSInteger sum = 0;
    for (NSNumber *integer in integers){
        NSInteger intValue = [integer integerValue];
        sum += intValue;
    }
    return sum;
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)singulars
{
    //    singulars = @[ @"hand"   ,
    //                   @"foot"   ,
    //                   @"knee"   ,
    //                   @"table"  ,
    //                   @"box"    ,
    //                   @"ox"     ,
    //                   @"axle"   ,
    //                   @"radius" ,
    //                   @"trivium"];
    //
    //    plurals = @[ @"hands" ,
    //                 @"feet"  ,
    //                 @"knees" ,
    //                 @"tables",
    //                 @"boxes" ,
    //                 @"oxen"  ,
    //                 @"axles" ,
    //                 @"radii" ,
    //                 @"trivia"];
    
    NSMutableArray *plurals = [[NSMutableArray alloc]init];
    for (NSString *word in singulars){
        if ([word hasSuffix:@"e"]){
            NSString *plural = [word stringByAppendingString:@"s"];
            [plurals addObject: plural];
        }
        else if ([word isEqualToString:@"hand"]){
            [plurals addObject:@"hands"];
        }
        else if ([word isEqualToString:@"foot"]){
            [plurals addObject:@"feet"];
        }
        else if ([word isEqualToString:@"box"]){
            [plurals addObject:@"boxes"];
        }
        else if ([word isEqualToString:@"ox"]){
            [plurals addObject:@"oxen"];
        }
        else if ([word isEqualToString:@"radius"]){
            [plurals addObject:@"radii"];
        }
        else if ([word isEqualToString:@"trivium"]){
            [plurals addObject:@"trivia"];
        }
    }
    return plurals;
}


-(NSDictionary *)countsOfWordsInString:(NSString *)string
{
    NSMutableDictionary *countsOfWordsInString = [[NSMutableDictionary alloc]init];
    
// 1. Remove all punctuation from the string.
    NSArray *punctuations = @[@".", @",", @";", @":", @"-"];
    NSString *stringWithoutPunctuation = [string copy];
    for (NSString *punctuation in punctuations){
        stringWithoutPunctuation = [stringWithoutPunctuation stringByReplacingOccurrencesOfString:punctuation withString:@""];
    }
    NSLog(@"This is the string with punctuation removed: %@", stringWithoutPunctuation);
    
// 2. Convert the string to all lowercase characters.
    NSString *lowercaseWithoutPunctuation = [stringWithoutPunctuation lowercaseString];
    
// 3. Create an array of the words in the string, by separating the string where the spaces occur.
    NSArray *wordsInString = [lowercaseWithoutPunctuation componentsSeparatedByString:@" "];
    
// 4. Iterate over the array in a for loop: First, check if the word is represented as a key in the dictionary. If not, add it as a key with value @(1). If it is already a key, reassign it to @(current value +1).
    for (NSString *word in wordsInString){
        if (![[countsOfWordsInString allKeys] containsObject: word]) {
            countsOfWordsInString[word] = @(1);
        }
        else {
            NSInteger wordCountInt = [countsOfWordsInString[word] integerValue];
            countsOfWordsInString[word] = @(wordCountInt +1);
        }
    }
    return countsOfWordsInString;
}


-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songsAndArtists
{
    NSMutableDictionary *songsGroupedByArtist = [[NSMutableDictionary alloc]init];
    
// 1. Separate each "Artist - Title" string into an array [Artist, Title].
    for (NSString *artistSong in songsAndArtists){
        NSArray *artistSongInArray = [artistSong componentsSeparatedByString:@" - "];
        NSString *artist = artistSongInArray[0];
        NSString *song = artistSongInArray[1];
        
// 2. Check to see if artist is contained in the dictionary as a key. If not, add artist key with value of empty mutable array. Then add corresponding song to the array.
        if (![[songsGroupedByArtist allKeys] containsObject:artist]){
            songsGroupedByArtist[artist] = [[NSMutableArray alloc]init];
            [songsGroupedByArtist[artist] addObject:song];
        }
        
// 3. If the artist is already contained in the dictionary as a key, reassign the key by adding the next song to the subarray, and alphabetize all the songs in the subarray.
        else {
            [songsGroupedByArtist[artist] addObject:song];
            NSSortDescriptor *alphabetizeSongs = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
            [songsGroupedByArtist[artist] sortUsingDescriptors:@[alphabetizeSongs]];
        }
    }
    return songsGroupedByArtist;
}
@end
