{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  phidgets_api,
  rclcpp,
  rclcpp_components,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    phidgets_spatial = substituteSource {
      src = fetchgit {
        name = "phidgets_spatial-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "90bae94b7db3cea81c1b86765c7d56ae79af9a87";
        hash = "sha256-My63osp4yOvSPXWqo60ZVvGbG6cF/ApGd5AegiOUg/M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_spatial";
  version = "2.3.3-1";
  src = sources.phidgets_spatial;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ phidgets_api rclcpp rclcpp_components sensor_msgs std_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
