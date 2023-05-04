
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
