# TCL script that uses integers to increase or substract values from IPv4 Address
# This procedure takes the negative or positive value immediately after one IP.
# Modifications to orignal creation from free_felicity
# ANSI Code array for bold colorized readability on black (Support on Nix and default consoles/terminals on Windows 10 and greater

    proc ip_mod {IP val} {
    
        # Color array for easy substs.
        set color(green) "\033\[1;92m" 
        set color(red) "\033\[1;31m"
        set color(yellow) "\033\[1;33m"
        set color(teal) "\033\[1;36m"
        set color(rst) "\033\[0m"
        
        # List for written ordinals for easy substs and output readability.
        set poz [list NULLD 1st 2nd 3rd 4th]
        
        set octs [split $IP "."]
        if {[llength $octs] != 4} {
            error "    IP address ''$color(yellow) $IP $color(rst)'' appears invalid. Ensure IPv4 address in dotted quad notation. "
        }
        set loop 1;
        foreach oct $octs {
            if {$oct > 255 || $oct < 0} {
                error "    Invalid IP address provided: ''$color(yellow) $IP $color(rst)''\n    Error in $color(red)[lindex $poz $loop] quad$color(rst): $color(teal) $oct $color(rst)\n    Value outside of range (0-255)."
            }
                        incr loop;
        }    
        lassign $octs oct1 oct2 oct3 oct4
        
        # CONVERT DOTTED-QUAD IPv4 ADDRESS TO AN INTEGER usimg formula.  
        set ip_int [expr { $oct1*int(pow(256,3)) \
                        + $oct2*int(pow(256,2)) \
                        + int($oct3*256)        \
                        + int($oct4)            \
                        }];
                        
        #ADD OR SUBTRACT VALUE
        incr ip_int $val;
        
        #CONVERT FROM INTEGER TO DOTTED-QUAD IPv4 ADDRESS
        set ret_octs {ret_oct1 ret_oct2 ret_oct3 ret_oct4};
        set loop 3;
        foreach ret_oct $ret_octs {
            set $ret_oct [expr {$ip_int/int(pow(256,$loop))}]
            set ip_int [expr {$ip_int - [subst $[subst $ret_oct]] * int(pow(256,$loop))}];
            incr loop -1;
        }
        return [join [lmap a [list {*}[string repeat "\$ " 4]] b $ret_octs {subst $a$b}] "."]
    } 
