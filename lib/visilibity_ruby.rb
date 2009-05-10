# This file is named visilibity_ruby.rb to work around problems with naming:
# I can't yet figure out how to make swig generate a module named VisiLibity
# into an SO called visilibity_native. 
# FIXME: would be nice to be able to rename this visilibity.rb.

# pull in VisiLibity.(so|bundle|...)
require 'VisiLibity'

def Inspectors(*fake_ivars)
  Module.new do
    define_method :inspect do
      ivar_str = fake_ivars.map{|iv| "@#{iv}=#{send(iv)}"}.join(" ")
      "#<%s:0x%x %s>" % [self.class.name, object_id, ivar_str]
    end
  end
end

class VisiLibity::BoundingBox
  include Inspectors(:x_min, :x_max, :y_min, :y_max)
  # TODO: ctor
end

class VisiLibity::Point
  include Inspectors(:x, :y)
end

