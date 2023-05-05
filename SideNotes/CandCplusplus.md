
- Win32 C is pretty trash. The typedefs on LPWSTR need to be manually typed as the built in concrete C builtin or re-typedef'd with the C standard builtin type


- Freeing a string/char twice causes a Debug Assertion crash and failure. This happened for me when the cleanup section was called after freeing pwsEvtMsg already earlier. See snippet
```        
        pwsEvtMsg = GetEvtMessageString(NULL, hEvent, EvtFormatMessageXml);
        if (pwsEvtMsg)
        {
            wprintf(L"\n [Extended Message Data] \n\t %s\n", pwsEvtMsg);
            free(pwsEvtMsg);
        }
    }

cleanup:

    if (hContext)
        EvtClose(hContext);

    if (hProviderMetadata)
        EvtClose(pwsEvtMsg);

    if (pRenderedValues)
        free(pRenderedValues);

//    if (pwsEvtMsg)
//        free(pwsEvtMsg);
```

- Compile will allow you to specify wide char arguments in the main() routine and even allow you to 'work' with them in the code without errors or compilation fail. However if you do not utilize wmain() you will receive garbage and of course your code wont work as intended.

```
            argv[0] = pwsPath;
            argv[1] = pwsQuery;

PS C:\Users\Administrator\source\repos\wevtutilbof\x64\Debug> .\wevtutilexe.exe Security /q "System[EventID=1101]" /c 300

The entire commandline CLI ARGC is 6 is the Path is (null)
Query is: (null)
Count is: 7

arg 0 -> ????????????????????????????????????e?????q???????????c?0??
```


