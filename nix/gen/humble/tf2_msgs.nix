{
  action_msgs,
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
        rev = "cd32e8752865d18715bd2d9caee21c34cbe9fa7c";
        hash = "sha256-4TrZkBRu9dGXnXd4pkYw9vDTcfm/tV0zq7vFhbC2q94=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_msgs";
  version = "0.25.7-1";
  src = sources.tf2_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs builtin_interfaces geometry_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
