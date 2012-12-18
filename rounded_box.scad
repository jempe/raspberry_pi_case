module rounded_box(box_length, box_width, box_height, round_corners_radius)
{
	separation = 0;

	round_corners_diameter = round_corners_radius * 2;

	echo("rounded box dimensions: w=",box_width," l=",box_length," h=",box_height);

	translate([round_corners_radius, round_corners_radius, round_corners_radius])
	{
		union()
		{
			cube(size = [(box_length + separation - round_corners_diameter), (box_width + separation - round_corners_diameter), (box_height + separation - round_corners_diameter)]);

			for(x = [0, 1])
			{
				for(y = [0, 1])
				{
					for(z = [0, 1])
					{
						translate([((box_length + separation - round_corners_diameter) * x), ((box_width + separation - round_corners_diameter) * y), ((box_height + separation - round_corners_diameter) * z)])
						{
							sphere(r = round_corners_radius);
						}
					}
				}
			}

			translate([0, (box_width + separation - round_corners_diameter), 0])
			{
				cube(size = [(box_length + separation - round_corners_diameter), round_corners_radius, (box_height + separation - round_corners_diameter)]);
			}

			translate([0, -(round_corners_radius), 0])
			{
				cube(size = [(box_length + separation - round_corners_diameter), round_corners_radius, (box_height + separation - round_corners_diameter)]);
			}

			translate([-(round_corners_radius), 0, 0])
			{
				cube(size = [(round_corners_radius), (box_width + separation - round_corners_diameter), (box_height + separation - round_corners_diameter)]);
			}

			translate([(box_length + separation - round_corners_diameter), 0, 0])
			{
				cube(size = [(round_corners_radius), (box_width + separation - round_corners_diameter), (box_height + separation - round_corners_diameter)]);
			}

			translate([0, 0, -(round_corners_radius)])
			{
				cube(size = [(box_length + separation - round_corners_diameter), (box_width + separation - round_corners_diameter), (round_corners_radius)]);
			}

			translate([0, 0, (box_height + separation - round_corners_diameter)])
			{
				cube(size = [(box_length + separation - round_corners_diameter), (box_width + separation - round_corners_diameter), (round_corners_radius)]);
			}

			for(axis1 = [0, 1])
			{
				for(axis2 = [0, 1])
				{
					translate([((box_length + separation - round_corners_diameter) * axis1), ((box_width + separation - round_corners_diameter) * axis2), 0])
					{
						cylinder(h = (box_height + separation - round_corners_diameter), r = round_corners_radius);
					}

					translate([((box_length + separation - round_corners_diameter) * axis1), 0, ((box_height + separation - round_corners_diameter) * axis2)])
					{
						rotate([270, 0 , 0])
						{
							cylinder(h = (box_width + separation - round_corners_diameter), r = round_corners_radius);
						}
					}

					translate([0, ((box_width + separation - round_corners_diameter) * axis1), ((box_height + separation - round_corners_diameter) * axis2)])
					{
						rotate([0, 90 , 0])
						{
							cylinder(h = (box_length + separation - round_corners_diameter), r = round_corners_radius);
						}
					}
				}
			}
		}
	}
}
