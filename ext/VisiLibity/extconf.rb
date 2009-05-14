require 'mkmf'

# need C++ support for visilibity
$libs = append_library($libs, "stdc++")

swig_dir = with_config('swig-dir', File.dirname(__FILE__))

create_makefile('VisiLibity')

# eww eww eww
original_makefile = File.read('Makefile')
File.open('Makefile', 'w') do |make|
  make.print %(
#{original_makefile}

#{swig_dir}/VisiLibity_wrap.cxx: #{swig_dir}/VisiLibity.i
\tswig -c++ -ruby #{swig_dir}/VisiLibity.i
  )
end
