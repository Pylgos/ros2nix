{
  ament_copyright,
  ament_flake8,
  ament_pep257,
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
    key_teleop = substituteSource {
      src = fetchgit {
        name = "key_teleop-source";
        url = "https://github.com/ros2-gbp/teleop_tools-release.git";
        rev = "74e108c4bd7264050ec731f12664d096ba308a0f";
        hash = "sha256-P0O7MXzaLKeuYvu6YMXX96VVA/7xslaPVosdEfWAtMU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "key_teleop";
  version = "1.5.0-1";
  src = sources.key_teleop;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
