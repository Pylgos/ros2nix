{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  game_controller_spl_interfaces,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    game_controller_spl = substituteSource {
      src = fetchgit {
        name = "game_controller_spl-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "1340cd67a3bed74f8305ee2c8d4cb80806cb0fff";
        hash = "sha256-gxc9n+NzM6UDj62ZKGA4EK0EbqFd5aRcwy6JbflwgrQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "game_controller_spl";
  version = "2.1.0-1";
  src = sources.game_controller_spl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ game_controller_spl_interfaces python3Packages.construct rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
