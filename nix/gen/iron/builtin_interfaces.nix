{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  rosidl_core_runtime,
  substituteSource,
}:
let
  sources = rec {
    builtin_interfaces = substituteSource {
      src = fetchgit {
        name = "builtin_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "785af8b60514e359187c4d445c6cc2a9e0b8a1cf";
        hash = "sha256-pkzsNUsSqHvfkAVDYZTudv5AOUdz12icQHUPEm16DpE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "builtin_interfaces";
  version = "1.6.0-2";
  src = sources.builtin_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_core_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
