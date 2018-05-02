Calculate String Metrics

# Package Overview

The `stringmetrics` package allows you to calculate the Levenshtein distance and Hamming distance between two strings.
The Hamming distance is defined only for strings of the same length. The Levenshtein distance is defined for strings of
arbitary length.

**Hamming Distance**

For two strings s and t, Hamming distance, H(s, t) is the number of places in which the two string differ, 
i.e., have different characters.

**Levenshtein Distance**

Levenshtein distance also known as edit distance, counts the differences between two strings, where we would count a 
difference not only when strings have different characters but also when one has a character whereas the other does not.
The distance is the number of deletions, insertions, or substitutions required to transform source string into target
string.


## Compatibility
|                    |    Version     |  
| :-----------------:|:--------------:| 
| Ballerina Language |    0.970.0    |


## Sample
First, import the `dushaniw/stringmetrics` package into the Ballerina project.
```ballerina
import dushaniw/stringmetrics;
```

Calculate the Levenshtein Distance by passing t he target and source strings as arguments to the function `calculateLevenshteinDistance`.
```ballerina
stringmetrics:calculateLevenshteinDistance("source string", "target string");
```

Calculate the Hamming Distance by passing the two strings as arguments to the function `calculateHammingDistance`. The
function returns `-1` if the two strings are not equal in size, if not it returns the calculated Hamming distance.
```ballerina
stringmetrics:calculateHammingDistance("string one", "string two");
```