{
  ament_cmake,
  ament_cmake_test,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros2cli,
  sros2,
  substituteSource,
}:
let
  sources = rec {
    sros2_cmake = substituteSource {
      src = fetchgit {
        name = "sros2_cmake-source";
        url = "https://github.com/ros2-gbp/sros2-release.git";
        rev = "a2cb82d009f0eb5cabfec877599cc71714b7141c";
        hash = "sha256-SsNjBbGlvQLawkc/YXUT2ux39XFt23b8ZtkVgayDR4Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sros2_cmake";
  version = "0.15.0-1";
  src = sources.sros2_cmake;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ros2cli sros2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
