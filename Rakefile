require 'rubygems'
require 'rake'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'rake/extensiontask'
Rake::ExtensionTask.new do |ext|
  ext.name = 'VisiLibity'
  ext.ext_dir = 'ext/VisiLibity'
  ext.lib_dir = 'lib'
  ext.source_pattern = "*.{c,cpp,cxx}"
end

