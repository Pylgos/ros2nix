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
    canopen_interfaces = substituteSource {
      src = fetchgit {
        name = "canopen_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "45c79d4c66a246d9b5b6f71e9c79865e1be15b27";
        hash = "sha256-b4Art6VZ5FZEibqz5dLOW4lYb2loGS/4m9HV9+jWrS4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_interfaces";
  version = "0.2.9-2";
  src = sources.canopen_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
