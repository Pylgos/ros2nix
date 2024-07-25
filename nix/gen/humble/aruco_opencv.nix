{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cpplint,
  ament_cmake_lint_cmake,
  ament_cmake_uncrustify,
  ament_cmake_xmllint,
  ament_lint_auto,
  aruco_opencv_msgs,
  buildPackages,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  libyamlcpp,
  python3Packages,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  substituteSource,
  tf2_geometry_msgs,
  tf2_ros,
}:
let
  sources = rec {
    aruco_opencv = substituteSource {
      src = fetchgit {
        name = "aruco_opencv-source";
        url = "https://github.com/ros2-gbp/aruco_opencv-release.git";
        rev = "4cf3c222f40231eccc8a943af7c13dd1f1f3c205";
        hash = "sha256-tiV6B/CW0NQwdUBv6oW4SnyYk3BP7ql92PR9grN6wZM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco_opencv";
  version = "2.3.1-1";
  src = sources.aruco_opencv;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ aruco_opencv_msgs cv_bridge image_transport libyamlcpp python3Packages.opencv4 rclcpp rclcpp_components rclcpp_lifecycle tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
