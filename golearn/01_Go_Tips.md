### Setting a binary `version` number using a builtin version variable during build
### Stolen from AzureHound code constants/misc.go 
```
// AzureHound version
// This gets populated at build time when the command being run uses the following flag:
// -ldflags "-X github.com/bloodhoundad/azurehound/v2/constants.Version=`git describe --tags --exact-match 2> /dev/null || git rev-parse HEAD`"
var Version string = "v0.0.0"
```
