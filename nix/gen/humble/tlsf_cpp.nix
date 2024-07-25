{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rmw,
  rmw_implementation_cmake,
  std_msgs,
  substituteSource,
  tlsf,
}:
let
  sources = rec {
    tlsf_cpp = substituteSource {
      src = fetchgit {
        name = "tlsf_cpp-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "2cc70b113e45e90cfafd2f8d0513cadaf8c378bb";
        hash = "sha256-hFBDZgnV3zbkfn2UU+rDhfvVOEVwnA+uEZzeSaxBjY4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tlsf_cpp";
  version = "0.13.0-2";
  src = sources.tlsf_cpp;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake rmw ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp std_msgs tlsf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
