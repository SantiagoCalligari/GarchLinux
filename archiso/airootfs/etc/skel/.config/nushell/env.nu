# Nushell Environment Config File


def create_left_prompt [] {

    let init = $"(ansi {bg:'#fda4ba' fg:'#000000'})   (ansi {fg:'#000000'  bg:'#fda4ba' attr:l})($env.LOGNAME) " 
    let path_segment = if $"($env.LOGNAME)" == $"(basename $env.PWD)" {
    ([
         $init $"  \n"] | str join)
    } else {
    ([
        $init  $"  (basename $env.PWD) "] | str join)
    }
    $path_segment
}

def create_right_prompt [] {
    let time_segment = ([
        $"(ansi {fg: '#fda4ba'})(ansi {bg: '#fda4ba' fg:'#000000'})" ( date now | date format '%H:%M' ) $"  "
    ] | str join)

    $time_segment
}

# Use nushell functions to define your right and left prompt
let-env PROMPT_COMMAND = { create_left_prompt }
let-env PROMPT_COMMAND_RIGHT = { create_right_prompt }

# The prompt indicators are environmental variables that represent
# the state of the prompt
let-env PROMPT_INDICATOR = { $'(ansi {fg:"#fda4ba" bg:"#202020"}) (ansi {bg:"#202020"})' }
let-env PROMPT_INDICATOR_VI_INSERT = { ": " }
let-env PROMPT_INDICATOR_VI_NORMAL = { "〉" }
let-env PROMPT_MULTILINE_INDICATOR = { "::: " }

# Specifies how environment variables are:
# - converted from a string to a value on Nushell startup (from_string)
# - converted from a value back to a string when running external commands (to_string)
# Note: The conversions happen *after* config.nu is loaded
let-env ENV_CONVERSIONS = {
  "PATH": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
  "Path": {
    from_string: { |s| $s | split row (char esep) | path expand -n }
    to_string: { |v| $v | path expand -n | str join (char esep) }
  }
}

# Directories to search for scripts when calling source or use
#
# By default, <nushell-config-dir>/scripts is added
let-env NU_LIB_DIRS = [
    ($nu.config-path | path dirname | path join 'scripts')
]

# Directories to search for plugin binaries when calling register
#
# By default, <nushell-config-dir>/plugins is added
let-env NU_PLUGIN_DIRS = [
    ($nu.config-path | path dirname | path join 'plugins')
]

# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# let-env PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
