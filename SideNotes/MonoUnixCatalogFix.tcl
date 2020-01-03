#!/usr/bin/env tclsh
#
# Usage: tclsh MonoUnixCatalogFix.tcl <target_file_to_clean>
#
# This is a TCL script to cleanup the global::Mono.Unix.Catalog.GetString reference in MonoDevelop projects which use Stetic.
# If these references, which stem from gettext localization, are left in a project. Then when the program is
# cross-compiled for Windows, there will be silent failures and the program wont run.
# Hence a script to automatically remove them.
# Additionally turn off the option in MonoDevelop under Project -> <SolutionName> Options > GTK# Settings > Enable Gettext Support
###

# Know Issues #
# Need more logic to parse multiple quotation mark strings that split into more than 2 groups:
# this.labelTotalScore2.LabelProp = global::Mono.Unix.Catalog.GetString("<span fgcolor=\"blue\" size=\"x-large\" weight=\"heavy\" > 0 </span>");
# For now one should make sure that <span> tags (and anything else) is using single quotes before processing


if {
    $argc == 0 || $argc > 1
} {
    puts stderr "Please supply a single target file";
    exit - 1
}

set filename[open[lindex $argv 0]
    "r"]
set tempfile[open[string cat "/tmp/temp-" [file tail[lindex $argv 0]]]
    "w"]
set lineno 0

while {
    [gets $filename line] >= 0
} {
    set lineno[expr {
        $lineno + 1
    }]

    if [string match "*\=\ global::Mono.Unix.Catalog.GetString(\"*"
        $line
    ] {

        puts "Found Type 1 match on Line $lineno"
        set splitted[split $line\ = ]
        set target[lindex $splitted 1]

        set firstq[string first\ " $target]
                set lastq[string last\ " $target]

                    set newtext[string range $target $firstq $lastq] set splitted[lreplace $splitted 1 1 $newtext] set line[join $splitted "= "]

                }
                elseif[string match "*,\ global::Mono.Unix.Catalog.GetString(*"
                    $line] {

                    puts "Found Type 2 match on Line $lineno"
                    set splitted[split $line ","]
                    set target[lindex $splitted 1]

                    set firstq[string first\ " $target]
                        set lastq[string last\ " $target]

                            set newtext[string range $target $firstq $lastq] set splitted[lreplace $splitted 1 1 $newtext] set line[join $splitted ", "]
                        }

                        puts $tempfile $line

                    }

                    close $filename
                    close $tempfile
                    exit 0
