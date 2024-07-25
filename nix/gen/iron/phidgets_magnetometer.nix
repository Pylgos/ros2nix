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
  substituteSource,
}:
let
  sources = rec {
    phidgets_magnetometer = substituteSource {
      src = fetchgit {
        name = "phidgets_magnetometer-source";
        url = "https://github.com/ros2-gbp/phidgets_drivers-release.git";
        rev = "3fc48fcbde6e934cd9746687da4063d27a0c3d75";
        hash = "sha256-3Ggm9kmzc70h+9ehA3T5rBXPWdUFeWN5ptgZJMeh+sk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "phidgets_magnetometer";
  version = "2.3.3-1";
  src = sources.phidgets_magnetometer;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ launch ];
  buildInputs = [  ];
  propagatedBuildInputs = [ phidgets_api rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
