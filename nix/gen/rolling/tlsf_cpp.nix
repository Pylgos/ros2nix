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
        rev = "b42ac9300575905a2b6a4b0c371f5635352f5bbf";
        hash = "sha256-Ll4kC+Guu2gv3D8OOGetNUoGURVRPXn44V0aE4+1mfE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tlsf_cpp";
  version = "0.18.0-1";
  src = sources.tlsf_cpp;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rmw std_msgs tlsf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
