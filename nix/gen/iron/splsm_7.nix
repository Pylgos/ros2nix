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
    splsm_7 = substituteSource {
      src = fetchgit {
        name = "splsm_7-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "785e770d2d2af9f14e9a5e960654cefde490d094";
        hash = "sha256-1p8aALbgBgrFMWw5wpWEe1EMNHq9NYMhGyzoEmfoD0Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "splsm_7";
  version = "3.1.0-1";
  src = sources.splsm_7;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
