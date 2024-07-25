{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  soccer_vision_2d_msgs,
  soccer_vision_3d_msgs,
  soccer_vision_attribute_msgs,
  substituteSource,
}:
let
  sources = rec {
    soccer_interfaces = substituteSource {
      src = fetchgit {
        name = "soccer_interfaces-source";
        url = "https://github.com/ros2-gbp/soccer_interfaces-release.git";
        rev = "2224909394318a66fc75e1c96e4345ebe9377ca5";
        hash = "sha256-4lOFn2p0uaDcS/4mDfWG/Q1OGsw8t1EAYJWVsHD6k+M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_interfaces";
  version = "0.1.0-1";
  src = sources.soccer_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ soccer_vision_2d_msgs soccer_vision_3d_msgs soccer_vision_attribute_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
