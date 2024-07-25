{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    tf2_msgs = substituteSource {
      src = fetchgit {
        name = "tf2_msgs-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "6dc01e6f8e18d9449f7aa9c86ad38f348dd037a3";
        hash = "sha256-xjPk4fJXvMWoldpuZutlTEULfPFjnhALyB/VyKO5NrU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_msgs";
  version = "0.38.0-1";
  src = sources.tf2_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
