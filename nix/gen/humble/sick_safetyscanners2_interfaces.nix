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
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    sick_safetyscanners2_interfaces = substituteSource {
      src = fetchgit {
        name = "sick_safetyscanners2_interfaces-source";
        url = "https://github.com/SICKAG/sick_safetyscanners2_interfaces-release.git";
        rev = "e88be7950debc9a5752e6ef4f7933ef5ed3cb2d0";
        hash = "sha256-FFsjwMwXpIDUcZce2QdkhLAspn9kJgyNkvTQ8UhjUYQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safetyscanners2_interfaces";
  version = "1.0.0-2";
  src = sources.sick_safetyscanners2_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
