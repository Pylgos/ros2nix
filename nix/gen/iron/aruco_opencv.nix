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
        rev = "b9f900705247c72171e96c67e6fa1c690f3a817a";
        hash = "sha256-gb3tLWsTAjspJ18jEMOoxaaQbkpCZ4YeghLgWplitYg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aruco_opencv";
  version = "5.2.1-1";
  src = sources.aruco_opencv;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ aruco_opencv_msgs cv_bridge image_transport libyamlcpp python3Packages.opencv4 rclcpp rclcpp_components rclcpp_lifecycle tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
