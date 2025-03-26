# Set standard editor
$env.config.buffer_editor = "codium"

# Functions for handling PATH
def-env path-append [d] { $env.PATH = ($env.PATH | append $d) }
def-env path-remove [d] {
    $env.PATH = ( $env.PATH | 
        each {|p|
            if $p != $d { $p }
        }
    )
}