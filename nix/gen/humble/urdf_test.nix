{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    urdf_test = substituteSource {
      src = fetchgit {
        name = "urdf_test-source";
        url = "https://github.com/pal-gbp/urdf_test-ros2-gbp.git";
        rev = "60c8d7c4b7247a10836f106e3cbf3aaae83c8f25";
        hash = "sha256-dsSlY//OxEePwNcGzjMIVsPxxTd7mxtxHMQAjNUiXtg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "urdf_test";
  version = "2.0.3-1";
  src = sources.urdf_test;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
