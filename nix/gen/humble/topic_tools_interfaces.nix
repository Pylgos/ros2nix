{
  ament_cmake_auto,
  ament_lint_auto,
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
    topic_tools_interfaces = substituteSource {
      src = fetchgit {
        name = "topic_tools_interfaces-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "79ad6f29fc30a3a99b5144114db5a7378ae370c9";
        hash = "sha256-DuVNxFmCNttMWhB75oEnU6FZF+WfkrAJUNc5Aex1Lss=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_tools_interfaces";
  version = "1.1.1-1";
  src = sources.topic_tools_interfaces;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
