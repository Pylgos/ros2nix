{
  ament_cmake_core,
  ament_cmake_python,
  ament_cmake_ros,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3,
  rosidl_cli,
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    rosidl_generator_type_description = substituteSource {
      src = fetchgit {
        name = "rosidl_generator_type_description-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "0befdfea839f3ab1520b527059ec99e8094aeec0";
        hash = "sha256-h0/MIBsGThMP49ziFm2y/kS0dyWaLOqpy6sHt7MRumA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_generator_type_description";
  version = "4.0.1-1";
  src = sources.rosidl_generator_type_description;
  nativeBuildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_index_python python3 rosidl_cli rosidl_parser ];
  buildInputs = [ ament_cmake_python ament_cmake_ros ];
  propagatedBuildInputs = [ ament_cmake_core ament_index_python rosidl_cli rosidl_parser ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
