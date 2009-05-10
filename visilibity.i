%module visilibity

%rename(BoundingBox) Bounding_Box;
%rename(LineSegment) Line_Segment;
%rename(PolarPoint) Polar_Point;
%rename(VisibilityPolygon) Visibility_Polygon;
%rename(VisibilityGraph) Visibility_Graph;

%{
#include "visilibity.hpp"
%}

%include "visilibity.hpp"

