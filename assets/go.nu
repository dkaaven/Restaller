let-env PATH = ($env.PATH | prepend $"($env.HOME)/.cargo/bin")
$env.GOROOT = "/usr/local/go"
$env.GOPATH = "$env.HOME/go"

# Update PATH to include GOPATH and GOROOT binaries
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.local/bin:$PATH