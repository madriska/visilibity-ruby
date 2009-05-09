require 'mkmf'

# need C++ support for visilibity
$libs = append_library($libs, "supc++")

create_makefile('visilibity')
