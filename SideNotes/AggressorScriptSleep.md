
##


## Arrays are fucking weird 1. `@savmal` is supposed to be `$samval` because it is a whole integer

## Arrays are fucking werid 2. Accessing the arrays is according to Sleep DashNine documentaiton using '%'. However in practice of Aggressor Script code and blog I have to use dot concatentation with variables. We must use the '$' sign.
```
    $creds = credentials();
    $creduser = $creds[0];
    blog2($1, "Read Credentials Data Model: " . $creduser["user"]);
    printAll(credentials());

```

## When bitwise AND'ing with the array of objects `@heval[count]` is wrong it causes an infinite loop/crash.

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



