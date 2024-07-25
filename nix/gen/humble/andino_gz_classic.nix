{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  andino_control,
  andino_description,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_ros,
  gazebo_ros2_control,
  gazebo_ros_pkgs,
  robot_state_publisher,
  ros2launch,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    andino_gz_classic = substituteSource {
      src = fetchgit {
        name = "andino_gz_classic-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "dfced6c860b3ba037265c5bbba7345ab398c72b9";
        hash = "sha256-QdcOpRG3atJE+waHNTLDY4QiFztYIRJbqrEgJpcGK/w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "andino_gz_classic";
  version = "0.1.0-1";
  src = sources.andino_gz_classic;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ andino_control andino_description control_msgs gazebo_ros gazebo_ros2_control gazebo_ros_pkgs robot_state_publisher ros2launch rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
