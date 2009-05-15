%module VisiLibity

%rename(BoundingBox) Bounding_Box;
%rename(LineSegment) Line_Segment;
%rename(PolarPoint) Polar_Point;
%rename(VisibilityPolygon) Visibility_Polygon;
%rename(VisibilityGraph) Visibility_Graph;

%rename(n) VisiLibity::Guards::N;
%rename("get") VisiLibity::Visibility_Graph::operator()(unsigned, unsigned, 
                                            unsigned, unsigned) const;
%rename("get") VisiLibity::Visibility_Graph::operator()(unsigned, unsigned) 
                                            const;
%rename("set") VisiLibity::Visibility_Graph::operator()(unsigned, unsigned, 
                                            unsigned, unsigned);
%rename("set") VisiLibity::Visibility_Graph::operator()(unsigned, unsigned);

/* C++ / Ruby impedance mismatches */
%rename(index) operator[];
%ignore operator!=;
%ignore operator=;
%rename("simple?") is_simple;
%rename("in_standard_form?") is_in_standard_form;
%rename("endpoint_of?") is_endpoint_of;
%rename("valid?") is_valid;


/* This is a bit shady, but it allows us to name the extension 
 * VisiLibity_native, so that we can name the Ruby entry point visilibity.rb 
 * without naming conflicts. */
%{
#define Init_VisiLibity Init_VisiLibity_native
%}

%{
#include "visilibity.hpp"
%}

/* Instantiate vector templates, as needed, for STL */
%include "std_vector.i"
namespace std {
  %template(PointVector) vector< VisiLibity::Point >;
  %template(PolygonVector) vector< VisiLibity::Polygon >;
}

%include "std_string.i"

%include "visilibity.hpp"

