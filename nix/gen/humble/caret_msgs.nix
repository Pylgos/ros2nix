{
  ament_cmake,
  ament_lint_auto,
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
    caret_msgs = substituteSource {
      src = fetchgit {
        name = "caret_msgs-source";
        url = "https://github.com/ros2-gbp/caret_trace-release.git";
        rev = "2877644443d74ce54b6e1ec92e47184d477167fa";
        hash = "sha256-KsmK/it47kXgjxRbS7DustdcPl0kc1GGpWP3aVZrvW4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "caret_msgs";
  version = "0.5.0-6";
  src = sources.caret_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
