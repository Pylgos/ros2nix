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
  rosidl_runtime_c,
  substituteSource,
}:
let
  sources = rec {
    rmw = substituteSource {
      src = fetchgit {
        name = "rmw-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "7d99635f205633dc7d85cb41cb59d4ca99132fb6";
        hash = "sha256-RGeLoc5aMdmxKPjtJ+eX4wGkEoWVO6oH1j0nOFqw/6w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw";
  version = "6.1.2-1";
  src = sources.rmw;
  nativeBuildInputs = [ ament_cmake_ros ament_cmake_version ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake_ros ament_cmake_version ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ rcutils rosidl_runtime_c ];
}
