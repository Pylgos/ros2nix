{
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcl_interfaces,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    composition_interfaces = substituteSource {
      src = fetchgit {
        name = "composition_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "4279d2abaec587bd4e631b6216997783e01aee9a";
        hash = "sha256-8OX9nEURTaMKAvWSBcVsg+nrOIVqJlIha4FT+YODnJg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "composition_interfaces";
  version = "1.2.1-1";
  src = sources.composition_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
