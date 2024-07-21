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
        rev = "785f02ef6ccd4c863ddb665f39498a854c14d0a3";
        hash = "sha256-ytGuQrW/Nt8ZX9IJPoGLQCbkrs/QPjZxskxKOD2rLtU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw";
  version = "7.3.1-1";
  src = sources.rmw;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_ros ament_cmake_version rosidl_dynamic_typesupport ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_ros ament_cmake_version rosidl_dynamic_typesupport ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rcutils rosidl_runtime_c ];
}
