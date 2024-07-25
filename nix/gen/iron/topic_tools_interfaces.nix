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
        rev = "e4c78bc9612b81bb6d209074b704c0d91114b95a";
        hash = "sha256-wVmpA5Ys/yh/xPZp+Z8CEi0pappWmJo1Qb/a/bGavXE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_tools_interfaces";
  version = "1.2.0-1";
  src = sources.topic_tools_interfaces;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
