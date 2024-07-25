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
        rev = "837a7b84ed1ec443404d89fb7a9e63c654ee4de8";
        hash = "sha256-CwNfbmq6wmChkeykcVbpgI7+sK7wcalOhPB8xmbEDGE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_description";
  version = "2.0.3-1";
  src = sources.leo_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ robot_state_publisher xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
