# This file is named visilibity_ruby.rb to work around problems with naming:
# I can't yet figure out how to make swig generate a module named VisiLibity
# into an SO called visilibity_native. 
# FIXME: would be nice to be able to rename this visilibity.rb.

# pull in VisiLibity.(so|bundle|...)
require 'VisiLibity'

module VisiLibity

  # Enables enumeration over Swig collections implementing size_method
  # and index().
  def self.SwigEnumerable(size_method=:size)
    Module.new do
      include Enumerable
      # Must eval a string here because #each takes a block. Oh bother.
      class_eval <<-RUBY
        def each
          (0...#{size_method}).each{|i| yield self.index(i)}
        end
      RUBY
    end
  end

  def self.Inspectors(*fake_ivars)
    Module.new do
      define_method :inspect do
        ivar_str = fake_ivars.map{|iv| "@#{iv}=#{send(iv).inspect}"}.join(" ")
        "#<%s:0x%x %s>" % [self.class.name, object_id, ivar_str]
      end
    end
  end

  class BoundingBox
    include VisiLibity::Inspectors(:x_min, :x_max, :y_min, :y_max)
    # TODO: ctor
  end

  class Point
    include VisiLibity::Inspectors(:x, :y)
  end

  class LineSegment
    include VisiLibity::Inspectors(:first, :second)
  end

  class Angle
    include VisiLibity::Inspectors(:angle)
    def angle
      get()
    end

    def angle=(a)
      set(a)
    end
  end

  class PolarPoint
    include VisiLibity::Inspectors(:range, :bearing)
  end

  class Ray
    include VisiLibity::Inspectors(:base_point, :bearing)
  end

  class Polyline
    include VisiLibity::SwigEnumerable(:size)
    include VisiLibity::Inspectors(:vertices)

    def vertices
      to_a
    end

    def [](x)
      index(x) # work around swig
    end
  end

  class Polygon
    include VisiLibity::SwigEnumerable(:n)
    include VisiLibity::Inspectors(:vertices)

    def vertices
      to_a
    end

    def [](x)
      index(x)
    end
  end

  class Environment
    # TODO
  end

  class Guards
    # TODO
  end

  class VisibilityPolygon
    # TODO
  end

  class VisibilityGraph
    # TODO
  end

end
