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
        rev = "92df2985c80f5a9f0f6b5861e54ea0a1e8026ca2";
        hash = "sha256-M7/eEP7tPukgpkdDKo93zEfydXTiLUzUaeR6h4c6lxM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "foxglove_msgs";
  version = "3.0.0-2";
  src = sources.foxglove_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rosidl_default_runtime visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}