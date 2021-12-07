# Maoluimhreacha
## Table of Contents
* [General Info](#general-info)
* [Technologies](#technologies)
* [Prolog Installation](#prolog-installation)
* [Usage](#usage)
* [Notes](#notes)

## General Info
This Prolog script generates numbers 0 - 1000 in the disjunctive number system in Irish in a principled way. 

## Technologies
[Prolog](https://en.wikipedia.org/wiki/Prolog) is a declarative programming language with roots in formal logic first developed in 1972 for artificial intelligence applications. I use the open-source [swi-prolog](https://www.swi-prolog.org/) release.

## Prolog Installation
If you're on macOS, make sure you have Homebrew installed:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Then install SWI-Prolog:
```
$ brew install swi-prolog
```
Otherwise, check out [SWI-Prolog's Downloads page](https://www.swi-prolog.org/Download.html).

## Usage
You can ask Prolog to print all the numbers by typing:

irish(A,\_,B,[number,disjunctive,_]).

It will print the Irish word(s), A, followed by the corresponding integer, B. They’ll print, more or less, in ascending order due to how I organized the script. It may be advisable to query for smaller, more manageable sets:

irish(A,\_,B,[number,disjunctive,zero]). to see zero.

irish(A,_,B,[number,disjunctive,ones]). to see numbers one through nine.

irish(A,_,B,[number,disjunctive,teens]). to see numbers ten through nineteen. 

Ten is included in this set for ease of programming later on. It behaves like the other -teen numbers in regards to use of the prefix ‘a’ that Irish employs for counting numbers. Ten and twelve will print first because they are both irregular forms and as such require their own predicates.

irish(A,_,B,[number,disjunctive,tens]). to see multiples of 10 between 20 and 90.

irish(A,_,B,[number,disjunctive,two_digits]). for numbers 21 through 99, excepting those that are equivalent to 0 modulo 10, as they belong to the previous set.

irish(A,_,B,[number,disjunctive,hundreds]). for multiples of 100 less than 1000.

irish(A,_,B,[number,disjunctive,three_digits]). for the remaining num- bers 101 through 999. 

Prolog will print each hundred with its units first, then each hundred with its teens, then each hundred with its multiples of ten, and then all the rest.

irish(A,_,B,[number,disjunctive,thousands]). to see 1000.

## Notes

Maoluimhreacha concatenation is, in large part, principled. There are how- ever, some irregular forms. Carrying those irregulars into the concatenations of bigger integers took some additional predicate definitions. Here are some examples:

• 10 and 12 are irregular compared to the rest of the -teens in Irish, so I hard-coded them.

• Irish has three words that all mean ‘-hundred’. One word, c ́ead, is only used with one-hundred. Ch ́ead is used with two- through six-hundred. Gc ́ead is used with seven- through nine-hundred. Accordingly, I needed to code three different predicates for -hundreds numbers.

• The words for ‘two’, ‘three’ or ‘four’, etc. when used to say ‘two-hundred’, etc. are general conjunctive numbers, not disjunctive. In this way, we’re describing ‘how many hundreds’ there are. Thus, I needed to include bunuimhreacha numbers two through nine in my script.

Aside from these logistical considerations, I had a bit of a difficult time finding confidence-inspiring resources online to fact-check my work. I’ve been learning on Duolingo, but they don’t provide a complete chart of all the numbers. I consulted Google translate, but as anyone who has tried to use it while traveling may have found out, it isn’t always terribly nuanced and accurate—even when translating between very widely spoken languages like English and Spanish. I tried my best to recreate the number system in an accurate and principled manner, but it is perhaps possible that there are some irregular forms I missed.
