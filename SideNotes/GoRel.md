

## Deals With teh D3VIL snf GoLangs Never Ending Annoying Local Packaging Issues

So when using the stupid replace directive in GoLang it matters if the replace directive for the local folder comes before of after the "require" statement as apparently according to AI which helped confuse the matter and then solve the matter. When I had it the replace before ....it presumed I had a local additional go.mod file in the subfolder of the endpoints which I didn't have that because I was using the go.mod in the root of the application for the overall app. The AI told me i didn't need one as I was using the root go.mod for it.

The layout was 

c:\Users\crt\Desktop\vtrest\
├── go.mod          (only one, at root)
├── go.sum
├── main.go
├── domainartifact.go
├── checker.go
└── endpoints/
    └── endpoints.go   (no go.mod here)


Though attempting to build or use VSCode with an endpoints input would give me an error and not compile. go mod tidy couldn't be used either

```
PS C:\Users\crt\Desktop\vtrest> go mod tidy
go: vtrest imports
        endpoints: module ./endpoints: reading endpoints\go.mod: open C:\Users\crt\Desktop\vtrest\endpoints\go.mod: The system cannot find the file specified.
```

After changing the file by just moving it. The diff is 


module vtrest

go 1.24.6
+
+require endpoints v0.0.0
+

replace endpoints => ./endpoints
-require (
-    endpoints v0.0.0
-    )


The AI then went back on it's claims I didn't need subfolder  go.mod (and at some point remove the already non-existanct go.mod from the endpoints subfolder). The AI ended up actually creating a go.mod with this contents of it 

```
module endpoints

go 1.24.6
```

Thusly the final subdirectory layout before I stopped getting error and it compiled was after running a go mod tidy and it unfucked itself. Fucking abhor the stupid packaging system in Go

c:\Users\crt\Desktop\vtrest\
├── go.mod          (one at root for overall root items)
├── go.sum
├── main.go
├── domainartifact.go
├── checker.go
└── endpoints/
    └── endpoints.go 
    └── go.mod   (new subfolder go.mod now added here)
