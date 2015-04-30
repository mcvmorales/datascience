Regular Expressions
===================
We may need a way to express:
* whitespace word boundaries  
* sets of literals  
* the beginning and end of a line  
* alternative

This is where metacharacters come into play.

Metacharacters
--------------
`^` represents the start of a line:
```r
^i think
```
will match the lines

    i think therefore i am
    i think i'm in love
    i think i love my wife

`$` represents the end of a line:
```r
morning$
```
will match the lines

  Good morning
  What are you up to this morning
  It rained this morning

Character Classes with `[]`
---------------------------
We can list a set of characters we will accept at a given point in the match
```r
[Bb] [Uu] [Ss] [Hh]
```
will match the lines

    The Democrats want Bush out of office
    Let's go bushwalking at Molonglo Gorge
    I'm listening to Bush - Hurricane (Album Version)
    
We can combine the above symbols together!
```r
^[Ii] am
```
will match the lines

    i am legend
    I am boycotting Apple
    I am the Walrus
    
We can also specify a range of characters or numbers, like `[a-z]`, `[a-zA-z]`, and `[0-9]`.
```r
^[0-9][a-zA-Z]  # any number from 0 through 9 followed by any letter(s)
```
will match the lines

    7th inning stretch
    3am -- can't sleep
    5ft 4in

We can use `^` at the beginning of a character class and indicates matching characters *not* in the indicated class.
```r
[^?.]$
```
will match the lines

    i like turtles
    This sentence doesn't end in a period or question mark!
    To be or not to be? That is the question
    
`.` is used to refer to any character.
```r
9.11
```
will match the lines

    Never forget 9/11.
    NetBios: Scanning IP 203.169.114.66
    Front door 9:11:46 AM
    (510) 555-9911

`|` translates to "or" -- we can use it for combining two expressions, the subexpressions becing called "alternatives." We can include any number of alternatives, i.e. `flood|fire|hurricane|earthquake`. We can also say `^[Gg]ood|[Bb]ad`. Using parentheses `()` can constrain the alternatives. If we wanted to find lines with only either "[Gg]ood" or "[Bb]ad" at the beginning, we use the parentheses like so: `^([Gg]ood|[Bb]ad]`).

`?` indicates that specified expression is optional, i.e. `[Ff]ranklin ([Dd]\.)? [Rr]oosevelt`.

More Metacharacters
-------------------
Recall in the above scenario we have to escape `.` since `.` is a metacharacter. Other metacharacters include `*` and `+`, which indicate repetition.
* `*` means "any number, including none, of the item"; the "greediness" of `*` can be turned off by saying `*?`
* `+` means "at least one of the item"

Another set of metacharacters are the curly braces/accolades `{}`, called interval quantifiers. They allow us to specify the minimum and maximum number of matches of an expression. For example, `[Bb]ush ( +[^ ]+ +) {1,5} debate` will give use lines that contain "Bush" or "bush", (a space, a non-space, a space) anywhere from 1 to 5 times, then "debate". In general, `{m,n}` means "at least `m` but not more than `n` matches. `{m}` means *exactly* `m` matches, while `{m, }` means *at least* `m` matches.

We can also refer to matched text with `\1`, `\2`, etc. For example, `+ ([a-zA-Z]+) +\1 +` will match the lines

    blah blah blah
    time for bed, night night!
    no quiero estudiar, ja ja ja
