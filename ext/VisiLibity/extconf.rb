require 'mkmf'

# need C++ support for visilibity
$libs = append_library($libs, "stdc++")

create_makefile('VisiLibity')
