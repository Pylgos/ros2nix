{
  ament_cmake,
  ament_cmake_copyright,
  ament_cmake_cppcheck,
  ament_cmake_uncrustify,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  libcurl_vendor,
  pkg-config,
  rclcpp,
  rclcpp_components,
  rtcm_msgs,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ntrip_client_node = substituteSource {
      src = fetchgit {
        name = "ntrip_client_node-source";
        url = "https://github.com/ros2-gbp/ublox_dgnss-release.git";
        rev = "8772eebd3318220cdf0d4461b7c21320ca73979b";
        hash = "sha256-1tjLSsDVITK4AqISfAFYFInOuD8TikclA8cO/VE7TKc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ntrip_client_node";
  version = "0.5.2-1";
  src = sources.ntrip_client_node;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ libcurl_vendor rclcpp rclcpp_components rtcm_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
