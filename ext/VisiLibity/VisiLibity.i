%module VisiLibity

%rename(BoundingBox_) Bounding_Box;
%rename(LineSegment) Line_Segment;
%rename(PolarPoint) Polar_Point;
%rename(VisibilityPolygon) Visibility_Polygon;
%rename(VisibilityGraph) Visibility_Graph;

/* C++ / Ruby impedance mismatches */
%rename(index) operator[];
%ignore operator!=;
%ignore operator=;

%{
#include "visilibity.hpp"
%}

/* Instantiate vector templates, as needed, for STL */
%include "std_vector.i"
namespace std {
  %template(PointVector) vector< VisiLibity::Point >;
}

%include "visilibity.hpp"

