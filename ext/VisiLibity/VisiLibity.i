%module VisiLibity

%rename(BoundingBox) Bounding_Box;
%rename(LineSegment) Line_Segment;
%rename(PolarPoint) Polar_Point;
%rename(VisibilityPolygon) Visibility_Polygon;
%rename(VisibilityGraph) Visibility_Graph;

%rename(n) VisiLibity::Guards::N;

/* C++ / Ruby impedance mismatches */
%rename(index) operator[];
%ignore operator!=;
%ignore operator=;

%rename("simple?") is_simple;
%rename("in_standard_form?") is_in_standard_form;
%rename("endpoint_of?") is_endpoint_of;
%rename("valid?") is_valid;


%{
#include "visilibity.hpp"
%}

/* Instantiate vector templates, as needed, for STL */
%include "std_vector.i"
namespace std {
  %template(PointVector) vector< VisiLibity::Point >;
  %template(PolygonVector) vector< VisiLibity::Polygon >;
}

%include "visilibity.hpp"

