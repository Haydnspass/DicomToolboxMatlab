function p = hg_plotStructSurf( struct_cube, struct_x1gv, struct_x2gv, struct_x3gv  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% create a bubble of zeros around the structure
% newx = size(struct_cube,1)+2;
% newy = size(struct_cube,2)+2;
% newz = size(struct_cube,3)+2;
% newcube = zeros(newx, newy, newz);
% newcube(2:newx-1, 2:newy-1, 2:newz-1) = struct_cube;

% plot structure
struct_cube_mask = struct_cube>0;
struct_cube_mask_eroded = convn(logical(struct_cube_mask),ones(3,3,3)/9,'same')>=3;

[x,y,z] = ndgrid(struct_x1gv, struct_x2gv, struct_x3gv);
%struct_cube2 = smooth3(struct_cube, 'box', 5);
struct_cube2 = struct_cube;
isosurf = isosurface(x,y,z,struct_cube_mask_eroded, 0, struct_cube2);
p = patch(isosurf, 'FaceColor', 'interp', 'EdgeColor', 'none');
colormap jet;

end