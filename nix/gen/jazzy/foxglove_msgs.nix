{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  ros_environment,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    foxglove_msgs = substituteSource {
      src = fetchgit {
        name = "foxglove_msgs-source";
        url = "https://github.com/ros2-gbp/ros_foxglove_msgs-release.git";
        rev = "1643daf92cf16b9a75cc2e3e184c7077de87db2a";
        hash = "sha256-M7/eEP7tPukgpkdDKo93zEfydXTiLUzUaeR6h4c6lxM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foxglove_msgs";
  version = "3.0.0-3";
  src = sources.foxglove_msgs;
  nativeBuildInputs = [ ament_cmake ros_environment rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}