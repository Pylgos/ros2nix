{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    fastrtps_cmake_module = substituteSource {
      src = fetchgit {
        name = "fastrtps_cmake_module-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport_fastrtps-release.git";
        rev = "7af149d83d7e4a2d4c9ce4ae9682bff4a8ebc28e";
        hash = "sha256-bpKwiB5iyCgIbXPEFnSWq6qNK+fxyrchLBcF+lA59ac=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastrtps_cmake_module";
  version = "2.2.2-2";
  src = sources.fastrtps_cmake_module;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
