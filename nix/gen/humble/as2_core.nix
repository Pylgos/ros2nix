{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  as2_msgs,
  buildRosPackage,
  cv_bridge,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic_msgs,
  geographiclib,
  geometry_msgs,
  image_transport,
  libyamlcpp,
  nav_msgs,
  python3Packages,
  rclcpp,
  rclcpp_action,
  rclcpp_lifecycle,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    as2_core = substituteSource {
      src = fetchgit {
        name = "as2_core-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "2750ac8d241a03a5316a9cedd2146ec85d49acce";
        hash = "sha256-CMSZ4w78yYHKz+fqmsKxYanNn/ILwvZtfe4FI0pu+xw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_core";
  version = "1.0.9-1";
  src = sources.as2_core;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ as2_msgs cv_bridge eigen geographic_msgs geographiclib geometry_msgs image_transport libyamlcpp nav_msgs python3Packages.pybind11 rclcpp rclcpp_action rclcpp_lifecycle sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
