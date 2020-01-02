#!/bin/sh
#
# Run this in ~/.config/csharp to automatically link the system assembly
# for the csharp live interpreter
#


ln -s /usr/lib/mono/gac/atk-sharp/2.12.0.0__35e10195dab3c99f/atk-sharp.dll atk-sharp.dll 
ln -s /usr/lib/mono/gac/gdk-sharp/2.12.0.0__35e10195dab3c99f/gdk-sharp.dll gdk-sharp.dll 
ln -s /usr/lib/mono/gac/glade-sharp/2.12.0.0__35e10195dab3c99f/glade-sharp.dll glade-sharp.dll 
ln -s /usr/lib/mono/gac/glib-sharp/2.12.0.0__35e10195dab3c99f/glib-sharp.dll glib-sharp.dll 
ln -s /usr/lib/mono/gac/gtk-sharp/2.12.0.0__35e10195dab3c99f/gtk-sharp.dll gtk-sharp.dll 
ln -s /usr/lib/mono/4.7-api/mscorlib.dll mscorlib.dll 
ln -s /usr/lib/mono/gac/pango-sharp/2.12.0.0__35e10195dab3c99f/pango-sharp.dll pango-sharp.dll 
ln -s /usr/lib/mono/4.7-api/System.Core.dll System.Core.dll 
ln -s /usr/lib/mono/4.7-api/System.dll System.dll 

# Using the "Using " directive for dot subs isnt really necessary per MonoDevelop 
#ln -s /usr/lib/mono/4.7-api/System.Drawing.dll System.Drawing.dll 
#ln -s /usr/lib/mono/4.7-api/Mono.Posix.dll Mono.Posix.dll 
