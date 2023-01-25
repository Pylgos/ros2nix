{ misc
, py3version
, ...
}:

let
  py3pkgs = misc."python${py3version}Packages";
in
{
  python3-catkin-pkg-modules = [ py3pkgs.catkin-pkg ];
  python3-ifcfg = [ py3pkgs.ifcfg ];
  python3-rosdistro-modules = [ py3pkgs.rosdistro ];
}
