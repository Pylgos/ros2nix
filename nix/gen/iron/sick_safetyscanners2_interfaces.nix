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
        rev = "cbfbe91b2df7c176577e2ed3f8d82a7ec0d17b39";
        hash = "sha256-FFsjwMwXpIDUcZce2QdkhLAspn9kJgyNkvTQ8UhjUYQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safetyscanners2_interfaces";
  version = "1.0.0-1";
  src = sources.sick_safetyscanners2_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
