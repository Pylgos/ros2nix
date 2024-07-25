{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_lint_auto,
  as2_core,
  as2_msgs,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ncurses,
  rclcpp,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    as2_alphanumeric_viewer = substituteSource {
      src = fetchgit {
        name = "as2_alphanumeric_viewer-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "0e13db2456c4c8c601a3ffddcaf400b1bf7d9c69";
        hash = "sha256-VDmVXgL/6Lqj3IKgZtWm7EtSkYcEiWv16gZsb2lJXvc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_alphanumeric_viewer";
  version = "1.0.9-1";
  src = sources.as2_alphanumeric_viewer;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_msgs eigen geometry_msgs ncurses rclcpp sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
