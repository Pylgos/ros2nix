{
  ament_cmake_gmock,
  ament_cmake_ros,
  ament_cmake_version,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rcutils,
  rosidl_dynamic_typesupport,
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rmw = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "55cb337a84bc56618b2c22243c8676b6cc3fe950";
        hash = "sha256-DkoHzvIQDqW7EHLNKXfmt/Gjxz04eXOcEsP+BLpBncI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw";
  version = "7.4.1-1";
  src = sources.rmw;
  nativeBuildInputs = [ ament_cmake_ros ament_cmake_version ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcutils rosidl_dynamic_typesupport rosidl_runtime_c ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
