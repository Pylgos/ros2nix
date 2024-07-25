{
  ament_cmake,
  ament_cmake_lint_cmake,
  ament_cmake_xmllint,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy_linux,
  substituteSource,
  teleop_twist_joy,
  teleop_twist_keyboard,
}:
let
  sources = rec {
    leo_teleop = substituteSource {
      src = fetchgit {
        name = "leo_teleop-source";
        url = "https://github.com/ros2-gbp/leo_common-release.git";
        rev = "2bf3e7e6fca2c3c4b2dce5e2ef1728e68e3c874a";
        hash = "sha256-sb4csK8ZJx5Q28wLOAXfsMdicYu+hvi5vTpj/jD0M8o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_teleop";
  version = "1.2.3-1";
  src = sources.leo_teleop;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joy_linux teleop_twist_joy teleop_twist_keyboard ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
