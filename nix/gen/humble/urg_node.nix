{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  laser_proc,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rosidl_default_generators,
  sensor_msgs,
  std_srvs,
  substituteSource,
  urdf,
  urg_c,
  urg_node_msgs,
}:
let
  sources = rec {
    urg_node = substituteSource {
      src = fetchgit {
        name = "urg_node-source";
        url = "https://github.com/ros2-gbp/urg_node-release.git";
        rev = "b6d7bc1e5fb9c00499608f725abd3aea9127be84";
        hash = "sha256-hz6upepfbgI1ToUr7XupzHvWBA7oKZk4QZTKCZwbMRI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urg_node";
  version = "1.1.1-1";
  src = sources.urg_node;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces diagnostic_updater laser_proc python3Packages.boost rclcpp rclcpp_components sensor_msgs std_srvs urdf urg_c urg_node_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
