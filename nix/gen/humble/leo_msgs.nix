{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
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
    leo_msgs = substituteSource {
      src = fetchgit {
        name = "leo_msgs-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "e7513f88489734579488ecc712c73574215617c3";
        hash = "sha256-q3G9C8ugTmaYMbclQAYyxRdcjpsJHDEFWle03AP8uK8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_msgs";
  version = "1.2.3-1";
  src = sources.leo_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
