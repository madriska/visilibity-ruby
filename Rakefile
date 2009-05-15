require 'rubygems'
require 'rake'
require 'rake/gempackagetask'
require 'rake/extensiontask'

VISILIBITY_VERSION = '0.0.1'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

gem_spec = Gem::Specification.new do |spec|
  spec.name = 'visilibity'
  spec.platform = Gem::Platform::RUBY
  spec.summary = "Ruby bindings to the VisiLibity library (www.visilibity.org)"
  spec.require_path = "lib"
  spec.files =  Dir.glob("{ext,lib}/**/*") +
                      ["Rakefile"]
  spec.extensions = FileList["ext/**/extconf.rb"]
  spec.version = VISILIBITY_VERSION
  spec.authors = ["Karl J. Obermeyer", "Brad Ediger"]
  spec.email = 'opensource@madriska.com'
  spec.homepage = "http://github.com/madriska/visilibity-ruby"
end

Rake::GemPackageTask.new(gem_spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end

Rake::ExtensionTask.new do |ext|
  ext.name = 'VisiLibity_native'
  ext.ext_dir = 'ext/VisiLibity'
  ext.lib_dir = 'lib'
  ext.source_pattern = "*.{c,cpp,cxx}"
  ext.gem_spec = gem_spec
end

