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
        rev = "dfdde72ea31462907468674ae00cf58f549d72a5";
        hash = "sha256-GbURdUeSknx39tMlj7gNw2Y/eOSlUYkXoaIOEjfaOKs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_msgs";
  version = "0.31.7-1";
  src = sources.tf2_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}