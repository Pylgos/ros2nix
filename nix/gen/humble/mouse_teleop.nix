{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    mouse_teleop = substituteSource {
      src = fetchgit {
        name = "mouse_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "e3013657fc89e668e48b2c88e60c461eb6d0eaba";
        hash = "sha256-4ApQu9cIv086UTOdot+fSpAb8OEJT8gTERQwK2OWWL0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mouse_teleop";
  version = "1.5.0-1";
  src = sources.mouse_teleop;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs python3Packages.tkinter rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
