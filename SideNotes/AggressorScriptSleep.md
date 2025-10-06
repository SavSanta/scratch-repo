
##


## Arrays are fucking weird 1. `@savmal` is supposed to be `$samval` because it is a whole integer

## Arrays are fucking werid 2. Accessing the arrays is according to Sleep DashNine documentaiton using '%'. However in practice of Aggressor Script code and blog I have to use dot concatentation with variables. We must use the '$' sign.
```
    $creds = credentials();
    $creduser = $creds[0];
    blog2($1, "Read Credentials Data Model: " . $creduser["user"]);
    printAll(credentials());

```

## When bitwise AND'ing with the array of objects `@hexval[count]` is wrong it causes an infinite loop/crash.

```
  if (-istrue (@hexval[$count] & @samval))        # Wrong. Infinite recusion loophang
  if (-istrue ($samval & @hexval[$count]))        # Correct
````
-----

##  Private methods/classes wont load in Aggressor Script/Sleep but you WILL NOT GET any errors for that in Sleep/Aggressor. It is a silent fail.

```
import sun.awt.X11.XClipboard;		# Was changed to be internal private in around Java 9 iirc.
$XCLIP = [new XClipboard: "Selection", "PRIMARY"];      # Will not fail expliciltly.
```
-----

## The UIManager can be used to alter LookAndFeel but default L&F of CS becomes wonky with tons of repainter fucks up by AWT-EventQueue NullPointerExceptions. 
Maybe one day I'll investigate more.

```
$um = [UIManager];
[UIManager setLookAndFeel: [UIManager getSystemLookAndFeelClassName]];
```
-----
## You can not pass the output of  an array as part os substitution expansion string. 
## Proper way to pass the output of array as a string to an output function. No quotations marks needed. Have to break it up if need to add text.
```
$res .= @textval[$count];
$res .= "\t\t";
#$res .= @hexval[$count];
$res .= "✓";
$res .= "\n";
```

-----
## The syntax to access complex nested class paths to use to use their enums

```
$RELATED = [javax.swing.LayoutStyle$ComponentPlacement RELATED];
$UNRELATED = [javax.swing.LayoutStyle$ComponentPlacement UNRELATED];
$INDENT = [javax.swing.LayoutStyle$ComponentPlacement INDENT];
$BASELINE = [javax.swing.GroupLayout$Alignment BASELINE];
```
------
# Unknown why I documented this one

```
[13:10:42] [!] attempted an invalid cast: class sleep.bridges.RegexBridge$isMatch cannot be cast to class sleep.interfaces.Operator (sleep.bridges.RegexBridge$isMatch and sleep.interfaces.Operator are in unnamed module of loader 'app') at cctc.cna:22
Callout the matches - @($null, $null, 'config.txt')
```

------
# Arrays Issue

WE must put the stupid parentheses after the array (and probably hash too) when using the `foreach` keyword. That includes even if the array is already assigned to a variable. Then the variable will go inbetween the parentheses in order to act as the predicate that will be used to pull values from.


        # Check octets within maximum range
		$parts = split("\\.", $ip);
        foreach $val ($parts) {
            #$val = $null;
            $val = int($val);
 
            if ($val == $null || $val < 0 || $val > 255) {
                $res = "ERROR: Invalid octet range.";
            return $res;
            }
        }

------

Got a style of error that is caused by a successful cast if/if else (incorrectly spelled as 'ifelse') clause that doesnt fix until it is pelled correctly
Offending Block
```
    while (size($matches) > 0) {
        $match = shift($matches);
        println("Callout the matches - $matches");
        
        # Remove surrounding quotes if present
        if (($match ismatch "^\"(.*)\"$")) {
            #$match = $1;
            println("Choice 1");
        } 
        elseif (($match ismatch "^'(.*)'$")) {
            #$match = $1;
            println("Choice 2");
        }
```

------

## API call limit exceeded

this type of  error typically occurs because there’s a limit on the number of API calls (before Cobalt Strike 4.12) that can be dynamically loaded in a single Beacon Object File (BOF). When using "No-Consolation," it likely hits this limit due to the number of Win32 APIs it attempts to import.
Try the below: 

    Reduce API Calls:

If you’re using custom BOFs or modifying "No-Consolation," check if there are redundant or non-essential Win32 API calls that can be removed.
In many BOF templates, unnecessary calls can sometimes be stripped out depending on the functionality you specifically need. For example, if the BOF has extra debugging or error-checking calls, try temporarily removing or commenting them out.

    Modify and Recompile the BOF:

Clone and modify "No-Consolation" to use fewer APIs.
Focus on the specific commands and functionalities you need, and remove any that aren't essential for your task.
Recompile it after reducing the code. In Cobalt Strike, this can often be done by modifying the C code and compiling it with x64-mingw (e.g., x86_64-w64-mingw32-gcc).

    Optimize the Beacon Environment:

In some cases, loading multiple BOFs with overlapping APIs can also cause this issue. If you have other BOFs active, try disabling them temporarily and re-running "No-Consolation."
Consider using a different method to accomplish your task if this particular BOF is not critical.

    Divide Functionality:

If the BOF is large, consider splitting its functionality across multiple, smaller BOFs to stay under the 
Use one BOF to establish an initial foothold and another to perform the needed actions.

	Reimplement some functions that are common or easy to do (for example the stdio funcs)

This has been done in the past for wcslen or strlen and similar.			

------



------


------
