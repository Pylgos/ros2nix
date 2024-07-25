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
        rev = "416dd5df31b5b99c316a9b921719a89c41482240";
        hash = "sha256-ii6OJV44dmTv1hb+syEw4Q4C4WO52VVPlTtjfP5YdEY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "splsm_7";
  version = "2.1.0-1";
  src = sources.splsm_7;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
