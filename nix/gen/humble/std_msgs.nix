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
    std_msgs = substituteSource {
      src = fetchgit {
        name = "std_msgs-source";
        url = "https://github.com/ros2-gbp/common_interfaces-release.git";
        rev = "0e7fd0e925dff00ec94de5712ca9b65f09dcf6f1";
        hash = "sha256-8pkRajfFfrzyQ/+O5SmpKnFT0VaPz+bmfzEOorYxWLA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "std_msgs";
  version = "4.2.4-1";
  src = sources.std_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
