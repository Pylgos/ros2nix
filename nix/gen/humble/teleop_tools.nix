{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joy_teleop,
  key_teleop,
  substituteSource,
  teleop_tools_msgs,
}:
let
  sources = rec {
    teleop_tools = substituteSource {
      src = fetchgit {
        name = "teleop_tools-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "66b3082c94524f427f9b9584383aa127e0e986bc";
        hash = "sha256-WmN/i4ppTEs6mXUMJhIIuv+z4LYd+SuJ/61i+YUORhw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "teleop_tools";
  version = "1.5.0-1";
  src = sources.teleop_tools;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joy_teleop key_teleop teleop_tools_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
