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
        rev = "60f4528bceebffc07bc24feccb70bbd17cb1339f";
        hash = "sha256-FXZ3pJ6bNIk5o2Om5C+LOP3dCWr3gXPqxUDI4J9GV20=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_ros_pkgs";
  version = "3.7.0-3";
  src = sources.gazebo_ros_pkgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_dev gazebo_msgs gazebo_plugins gazebo_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
