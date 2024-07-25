{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    unique_identifier_msgs = substituteSource {
      src = fetchgit {
        name = "unique_identifier_msgs-source";
        url = "https://github.com/ros2-gbp/unique_identifier_msgs-release.git";
        rev = "76d43047f71a1ff2c9865094b325bf1b0a4becae";
        hash = "sha256-bC/ZqwXMkI4Fgqlw4fDPwVAl9QkWnU5BOc2oQ9oa+Ac=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "unique_identifier_msgs";
  version = "2.2.1-3";
  src = sources.unique_identifier_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
