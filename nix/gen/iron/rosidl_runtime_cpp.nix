{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  performance_test_fixture,
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rosidl_runtime_cpp = substituteSource {
      src = fetchgit {
        name = "rosidl_runtime_cpp-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "93ec34b11ec097605553e0babb9d0c6e422618d2";
        hash = "sha256-hy+nwaHbvUo9dT8WHZBD3RpklYx2+lPGFn5P8xPv934=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_runtime_cpp";
  version = "4.0.1-1";
  src = sources.rosidl_runtime_cpp;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
