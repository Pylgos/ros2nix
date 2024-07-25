{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_cppcheck,
  as2_core,
  as2_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  librealsense2,
  nav_msgs,
  rclcpp,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_ros,
}:
let
  sources = rec {
    as2_realsense_interface = substituteSource {
      src = fetchgit {
        name = "as2_realsense_interface-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "f1f6384eb9f8eed8d93cffd25b8788014f572351";
        hash = "sha256-2UgnDizv1F/vpck7TRNjxIBBrCvllrI1E+ucnyvkv9o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_realsense_interface";
  version = "1.0.9-1";
  src = sources.as2_realsense_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_core as2_msgs geometry_msgs librealsense2 nav_msgs rclcpp sensor_msgs std_msgs std_srvs tf2 tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
