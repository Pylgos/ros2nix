{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_msgs,
  gazebo_plugins,
  gazebo_ros,
  substituteSource,
}:
let
  sources = rec {
    gazebo_ros_pkgs = substituteSource {
      src = fetchgit {
        name = "gazebo_ros_pkgs-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "1f593a6a96d929a3929327e1a8ad22fcf0a44fb8";
        hash = "sha256-FXZ3pJ6bNIk5o2Om5C+LOP3dCWr3gXPqxUDI4J9GV20=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_ros_pkgs";
  version = "3.7.0-1";
  src = sources.gazebo_ros_pkgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_dev gazebo_msgs gazebo_plugins gazebo_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
