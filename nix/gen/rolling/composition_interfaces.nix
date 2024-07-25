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
        rev = "b0fdee2634f93ebde7828118d72cb692daccee26";
        hash = "sha256-86vBOQKOSZvDC4nfmQVC7hKzgCQbCpdZSCADUMi0QC0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "composition_interfaces";
  version = "2.2.0-1";
  src = sources.composition_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}