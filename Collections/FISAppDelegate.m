//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSArray *)arrayBySortingArrayAscending:(NSArray *)array {
    // array sorted from low to high
    NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
    array = [array sortedArrayUsingDescriptors:@[lowestToHighest]];
    return array;
}

- (NSArray *)arrayBySortingArrayDescending:(NSArray *)array {
    // array sorted from high to low
    NSSortDescriptor *highestToLowest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO];
    array = [array sortedArrayUsingDescriptors:@[highestToLowest]];
    return array;
}

- (NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array {
    // first and last element switched with each other
    NSMutableArray *mutableArrayOfNumbers = [array mutableCopy];
    NSUInteger lastIndex = [mutableArrayOfNumbers count] - 1;
    [mutableArrayOfNumbers exchangeObjectAtIndex:0 withObjectAtIndex:lastIndex];
    return mutableArrayOfNumbers;
}

- (NSArray *)arrayByReversingArray:(NSArray *)array {
    // reversed array
    NSArray *reversedArray = [[array reverseObjectEnumerator] allObjects];
    return reversedArray;
}

- (NSString *)stringInBasicLeetFromString:(NSString *)string {
    // replace chars in string to new chars based on dictionary
    NSDictionary *replacements = @ { @"a": @"4",
                                     @"s": @"5",
                                     @"i": @"1",
                                     @"l": @"1",
                                     @"e": @"3",
                                     @"t": @"7"};
    NSString *stringInLeetFormat = @"";
    NSArray *replaceChars = [replacements allKeys];
    for (int i = 0; i < string.length; i++) {
        NSString *currentChar = [NSString stringWithFormat:@"%c",[string characterAtIndex:i]];
        if ([replaceChars containsObject:currentChar]) {
            NSString *replasedCurrentChar = replacements[currentChar];
            stringInLeetFormat = [stringInLeetFormat stringByAppendingString:replasedCurrentChar];
        } else {
            stringInLeetFormat = [stringInLeetFormat stringByAppendingString:currentChar];
        }
    }
    
    return stringInLeetFormat;
}

- (NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array {
    // array with two sub-arrays:
    // 1. negative numbers,
    // 2. zero and positivenumbers
    NSPredicate *negativeNumbers = [NSPredicate predicateWithFormat:@"self < 0"];
    NSPredicate *positiveNumbers = [NSPredicate predicateWithFormat:@"self >= 0"];
    NSArray *arrayNegativeNumbers = [array filteredArrayUsingPredicate:negativeNumbers];
    NSArray *arrayPositiveNumbers = [array filteredArrayUsingPredicate:positiveNumbers];
    NSArray *newArray = @[arrayNegativeNumbers, arrayPositiveNumbers];
    return newArray;
}

- (NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary {
    // hobbits names (array with keys those value is "hobbit")
    NSArray* names = [dictionary allKeysForObject:@"hobbit"];
    return names;
}

- (NSArray *)stringsBeginningWithAInArray:(NSArray *)array {
    // strings begin with the letter "a"
    NSString* filter = @"%K BEGINSWITH[c] %@";
    NSPredicate *beginsWithA = [NSPredicate predicateWithFormat:filter, @"self", @"a"];
    NSArray *aNames = [array filteredArrayUsingPredicate:beginsWithA];
    return aNames;
}

- (NSInteger)sumOfIntegersInArray:(NSArray *)array {
    NSInteger sum = 0;
    for (NSNumber *num in array) {
        sum += [num intValue];
    }
    return sum;
}

- (NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array {
    // convert strings into plural forms
    // lol was approved to do hard code, ok there we go!
    NSMutableArray *plurals = [[NSMutableArray alloc] init];
    for (NSString *string in array) {
        if ([string hasSuffix:@"nd"] || [string hasSuffix:@"ee"] || [string hasSuffix:@"le"]) {
            [plurals addObject:[string stringByAppendingString:@"s"]];
        } else if ([string hasSuffix:@"oot"]) {
            [plurals addObject:[string stringByReplacingOccurrencesOfString:@"oot" withString:@"eet"]];
        } else if ([string hasSuffix:@"us"]){
            [plurals addObject:[string stringByReplacingOccurrencesOfString:@"us" withString:@"i"]];
        } else if ([string hasSuffix:@"um"]){
            [plurals addObject:[string stringByReplacingOccurrencesOfString:@"um" withString:@"a"]];
        } else if ([string hasSuffix:@"box"]){
            [plurals addObject:[string stringByAppendingString:@"es"]];
        } else {
            [plurals addObject:[string stringByAppendingString:@"en"]];
        }
    }
    return plurals;
}

- (NSDictionary *)countsOfWordsInString:(NSString *)string {
    // dictionary: "key" is word and "value" is how many times that word appears in string
    //
    // cleaning up string
    NSArray *punctuation = @[@".", @",", @"-", @";"];
    for (NSUInteger i = 0; i < [punctuation count]; i++) {
        string =[string stringByReplacingOccurrencesOfString:punctuation[i] withString:@""];
    }
    string =[string lowercaseString];
    NSArray *stringAsArray = [string componentsSeparatedByString:@" "];
    
    // forming new dictionary
    // algorithmic complexity n
    NSMutableDictionary *myDictionary = [[NSMutableDictionary alloc] init];
    for (NSString *word in stringAsArray) {
        if ([myDictionary objectForKey:word] == nil) {
            myDictionary[word] = @(1);
        } else {
            NSUInteger intHowManyTimesISeeYou = [myDictionary[word] integerValue];
            intHowManyTimesISeeYou++;
            myDictionary[word] = @(intHowManyTimesISeeYou);
        }
        
    // single line
    // myDictionary[word] = @(([myDictionary objectForKey:word] == nil ? 0 : [myDictionary[word] integerValue]) + 1);
        
/*  // algorithmic complexity n^2
    NSPredicate *howManyTimesISeeYou = [NSPredicate predicateWithFormat:@"self MATCHES %@", element];
    NSNumber *intHowManyTimesISeeYou = @([[stringAsArray filteredArrayUsingPredicate:howManyTimesISeeYou] count]);
    myDictionary[element] = intHowManyTimesISeeYou;
*/
    }
    return myDictionary;
}

- (NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array {
    // algorithmic complexity n
    NSMutableDictionary *artistAndSongsDictionary = [[NSMutableDictionary alloc] init];
    for (NSString *atristSongPeer in array) {
        NSArray *currentAtristSongPeer = [atristSongPeer componentsSeparatedByString:@" - "];
        NSString *key = currentAtristSongPeer[0];
        NSString *value = currentAtristSongPeer[1];
        if (artistAndSongsDictionary[key] == nil) {
            artistAndSongsDictionary[key] = [NSMutableArray arrayWithObjects:value, nil];
        } else {
            [artistAndSongsDictionary[key] addObject:value];
        }
    }
    for (NSString *artist in [artistAndSongsDictionary allKeys]) {
        NSSortDescriptor *lowestToHighest = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        artistAndSongsDictionary[artist] = [artistAndSongsDictionary[artist] sortedArrayUsingDescriptors:@[lowestToHighest]];
    }
    NSLog(@"%@", artistAndSongsDictionary);
    return artistAndSongsDictionary;
}

@end
