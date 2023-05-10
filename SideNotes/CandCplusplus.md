
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

- This is just a reminder of the ULARGE_INTEGER structure and TIMEDATE structure on Windows (based on finding an issue when using a non-compiler compiler of CS COFF/BeaconLoader which doesnt support 32 bit well. ). They have QuadParts but the formula when you cant use QuadParts is this: "And just to clarify, HighPart and LowPart are both just 32 bits, with the following condition (sans casting) being true on compilers that natively support 64-bit integers: `QuadPart == (HighPart << 32) & LowPart` "

-- in reference to the above. Thinking about a way to fix this would be to __asm inline. As the operations are indeed Intel ASM code that is available in VS Studio directory respectively for each machine command. Therefore reference "Inline Assembler | Microsoft Learn"  when your not lazy and play on implementing this. Both in x86 of rdir and wevtq.

-- in reference to above looking at the old Win Event Loggiing stuff. I see there is an old XP era function in WINNT Int32x32To64 that "performs optimally on 32-bit Windows" and is implemented as "This function is implemented on all platforms by optimal inline code". So in theory that saves work maybe. Found in their old records method of timestamp obtainment
