{
  ament_cmake,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geometry_msgs,
  python3Packages,
  sensor_msgs,
  substituteSource,
  unique_identifier_msgs,
}:
let
  sources = rec {
    geodesy = substituteSource {
      src = fetchgit {
        name = "geodesy-source";
        url = "https://github.com/ros2-gbp/geographic_info-release.git";
        rev = "a02a9219427f2c7f404dd0099e72df45d8b7d318";
        hash = "sha256-+iSI/nF1U9zJNt1tRwph3J72AI6GDwamBRol2QrwTUY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "geodesy";
  version = "1.0.6-1";
  src = sources.geodesy;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles geographic_msgs geometry_msgs python3Packages.catkin-pkg python3Packages.pyproj sensor_msgs unique_identifier_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
