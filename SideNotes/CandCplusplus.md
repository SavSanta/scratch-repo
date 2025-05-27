
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


-- Using byte/unsigned char*/void * help:

Use char when referring to characters. Use ::std::byte when referring to bytes, it's just an enum class of unsigned char anyway. Why not use straight unsigned char? Because when do you ever want to perform modulo arithmetic on bytes? Bytes and unsigned types are not, conceptually, the same thing. They byte type actually restricts your operations to bitwise only. Use a void pointer to be generic, to keep others from knowing type information, when you know what to cast it to, and when the only other things to do with it are to hold onto it, or delete it, but again, you need to know how. There are higher level patterns for holding things, if that's something you need. It's not often useful to erase type information. 

-- alternative help to using byte/unsigned char*/or void *

 16

(This is a potential rule of thumb which comes off the top of my head, not condoned by anyone.)
Rule of thumb: When to use which kind of pointer?

    Use char * for sequences of textual characters, not anything else.
    Use void * in type-erasure scenarios, i.e. when the pointed-to data is typed, but for some reason a typed pointer must not be used or it cannot be determined whether it's typed or not.
    Use byte * for raw memory for which there is no indication of it holding any typed data.

An exception to the above:

    Also use void */unsigned char */char * when older code; or when non-C++ code forces you and you would otherwise use byte *. But when doing this, you could still wrap such use with a byte *-based interface, thus not exposing this state of affairs to the rest of your C++ code.


- Translating a 64-bit pointer into a ULONGLONG works. I have had to used this for WINDOWS-BASED FILETIME objects. Thank you Neha (https://stackoverflow.com/a/51402275)
```
FILETIME ftime; __int64 i64;
*(__int64 *)&ftime = i64;
```

- Casting Between unsigned char and char pointers
If I have an unsigned char* ucData, and need to interpret it as a C-style (aka terminated by nulls) string (char*) (for say printf or whatever), then the correct and safe cast is:

	`char* chNewCastedData = (char*) ucData;`
	
This is possible because unsigned char* and char* are both pointers to bytes. 
An unsigned char* is typiallly used for raw binary data however while signed char is used for data with null terminations.


- Mismatching pointer levels

Mismatch between pointer levels (char** vs char*) is dangerous enough to causes crashes and undefined behavior (aka annoying subtle bugs). 


- How to avoid static buffers by using Malloc instead of static buffers. (The caller must free the memory tho if you do this!)

```
WCHAR* RemovePrefix(WCHAR* ss) {
    DWORD ssLen = wcslen(ss);
    if (ssLen <= 3) return NULL;

    DWORD copyLen = ssLen - 3;
    WCHAR* buf = (WCHAR*)malloc((copyLen + 1) * sizeof(WCHAR));
    if (!buf) return NULL;

    for (DWORD i = 0; i < copyLen; i++) {
        buf[i] = ss[i + 3];
    }
    buf[copyLen] = L'\0';

    printf(L"SOME TEST OF THE NAME IS %ls", buf);
    return buf; // Caller must free()
}
```

- Quick FILETIME to UNIXTIME function

```
#define WINDOWS_TICK 10000000ULL
#define SEC_TO_UNIX_EPOCH 11644473600ULL  // Seconds between 1601-01-01 and 1970-01-01

void filetime_to_date(uint64_t filetime) {
    // Convert FILETIME (100-ns intervals since 1601) to Unix time (seconds since 1970)
    time_t unix_time = (time_t)(filetime / WINDOWS_TICK - SEC_TO_UNIX_EPOCH);
    <snip>
```	
	

