{
  action_msgs,
  ament_cmake,
  ament_cmake_core,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  service_msgs,
  substituteSource,
}:
let
  sources = rec {
    rosidl_default_generators = substituteSource {
      src = fetchgit {
        name = "rosidl_default_generators-source";
        url = "https://github.com/ros2-gbp/rosidl_defaults-release.git";
        rev = "3d061b5b0039fde27c015b08a758c04e80fe7a4f";
        hash = "sha256-QFyz1GpH22oEIjldw7sgculU02hS8+nLFzh4U/jbBn0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosidl_default_generators";
  version = "1.5.0-3";
  src = sources.rosidl_default_generators;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core rosidl_core_generators ];
  buildInputs = [ ament_cmake ];
  propagatedBuildInputs = [ ament_cmake_core rosidl_core_generators ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [ action_msgs service_msgs ];
}
