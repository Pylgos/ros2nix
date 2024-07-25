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
        rev = "bc1368f30d5b593796909b20c9f6f017e61e5078";
        hash = "sha256-2oZnTAJ48CwmLLfT3JlFfo7f7f+XhDiTJpYMkhtYaDQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "composition_interfaces";
  version = "1.6.0-2";
  src = sources.composition_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
