%module VisiLibity
%include "std_vector.i"

%rename(BoundingBox) Bounding_Box;
%rename(LineSegment) Line_Segment;
%rename(PolarPoint) Polar_Point;
%rename(VisibilityPolygon) Visibility_Polygon;
%rename(VisibilityGraph) Visibility_Graph;

/* C++ / Ruby impedance mismatches */
%rename(index) operator[];
%ignore operator!=;

%{
#include "visilibity.hpp"
%}

%include "visilibity.hpp"

