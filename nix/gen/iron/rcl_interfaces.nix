{
  ament_cmake,
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
    rcl_interfaces = substituteSource {
      src = fetchgit {
        name = "rcl_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "24fe82de724c92c1350ac1d290bec9d6911bd9f8";
        hash = "sha256-JOuLzqEh2xuSaIbKZ32FG4wTlVKMYo1JQ/PEGnVLYJo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcl_interfaces";
  version = "1.6.0-2";
  src = sources.rcl_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
