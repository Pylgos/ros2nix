{
  ament_cmake,
  ament_cmake_clang_format,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  opencv,
  rclcpp,
  rclcpp_components,
  rosbag2_cpp,
  rosbag2_storage,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    bag2_to_image = substituteSource {
      src = fetchgit {
        name = "bag2_to_image-source";
        url = "https://github.com/ros2-gbp/bag2_to_image-release.git";
        rev = "8126239990ed77c8d035a13c83aa67ff7d4c3b67";
        hash = "sha256-D602KBwsYPh+wbNrK2y25DZk1/wPPc2PlZj4ktvPhqI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "bag2_to_image";
  version = "0.1.0-4";
  src = sources.bag2_to_image;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ opencv rclcpp rclcpp_components rosbag2_cpp rosbag2_storage sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
