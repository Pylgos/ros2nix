{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    data_tamer_msgs = substituteSource {
      src = fetchgit {
        name = "data_tamer_msgs-source";
        url = "https://github.com/ros2-gbp/data_tamer-release.git";
        rev = "6598feb7ecb48c7b5848cff99858af23f52409f4";
        hash = "sha256-bUzdvLZPpjzVjv6FRTQerjOpQfhnKgZE1qr7MxwLxq0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "data_tamer_msgs";
  version = "0.9.3-2";
  src = sources.data_tamer_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
