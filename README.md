## bash-ini-parser

A ini file parser for bash relying only on builtins

### Using

You must copy bash-ini-parser on your project and source it

    $ source bash-ini-parser

or

    $ . source bash-ini-parser

It will declare functions per section called cfg.section.<section> with variable declaration inside so you can access its values using

    $ cfg.section.<section>
    $ echo $var

### test it

Goto test directory and launch test.sh

    $ cd test
    $ ./test.sh

Inspect its code, reuse on your scripts

If you want to test your existing ini file use testfile.sh

    $ testfile.sh &gt;customfile.ini&lt; sectionname varname

e.g.:

    $ ./testfile.sh file.ini sec1 var4
    show parsed file.ini
    [sec1]
    var1="foo"
    var2="hoge"
    var3="fuga"
    var4="pivo"
    [sec2]
    var1="bar"
    var2="foo"
    var3="eco"
    var4="piyo baz qux"
    var5="foo"
    var6="hoge"

    var4 value is "pivo"
    
### Drawbacks

This is more a hack than a reliable parser, so keep in mind things like

 - multiword value vars will be arrays so you must access it as `${var[*]}`
 - changing from section to section will not erase previous var declarations

For a trusted parser (but based on python) checkout [crudini](https://github.com/pixelb/crudini)

### Credits

This is just an enhacement from http://theoldschooldevops.com/2008/02/09/bash-ini-parser
