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
        rev = "2f17da71dd47b5f86adde17714b76338e5926015";
        hash = "sha256-+qr+bioDcROBM3r1a68dKIdhVBXe2i7EUKUCSQGo6Ns=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "game_controller_spl";
  version = "3.1.0-1";
  src = sources.game_controller_spl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ game_controller_spl_interfaces python3Packages.construct rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
