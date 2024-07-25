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
        rev = "93c067461fc98ee940963410450fa411e6057685";
        hash = "sha256-PCQLDp69v1WdR4/hXUeJGmkZrh+mb+hA2nSn0l+L74I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "leo_teleop";
  version = "2.0.3-1";
  src = sources.leo_teleop;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joy_linux teleop_twist_joy teleop_twist_keyboard ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
