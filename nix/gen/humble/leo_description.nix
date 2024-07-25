{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  robot_state_publisher,
  substituteSource,
  xacro,
}:
let
  sources = rec {
    leo_description = substituteSource {
      src = fetchgit {
        name = "leo_description-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "c2be9ee21a662785dafac70c495e88b0eaf50dcc";
        hash = "sha256-NRrOioyNWBXWuImJRa0ndwJhk9TaFxUrn7sS5FH/MgA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_description";
  version = "1.2.3-1";
  src = sources.leo_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
