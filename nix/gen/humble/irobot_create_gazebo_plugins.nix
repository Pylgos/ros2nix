{
  ament_cmake,
  ament_cmake_cppcheck,
  ament_cmake_cpplint,
  ament_cmake_flake8,
  ament_cmake_lint_cmake,
  ament_cmake_pep257,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_dev,
  gazebo_ros,
  geometry_msgs,
  irobot_create_msgs,
  irobot_create_toolbox,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    irobot_create_gazebo_plugins = substituteSource {
      src = fetchgit {
        name = "irobot_create_gazebo_plugins-source";
        url = "https://github.com/ros2-gbp/create3_sim-release.git";
        rev = "dece935213b3017928a8b52ee4bb5921d15455d2";
        hash = "sha256-09luFoNWxSKOUpwGKNsGCItmDaJfMclnUO0o6FJmJBM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "irobot_create_gazebo_plugins";
  version = "2.1.0-1";
  src = sources.irobot_create_gazebo_plugins;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_dev gazebo_ros geometry_msgs irobot_create_msgs irobot_create_toolbox rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
