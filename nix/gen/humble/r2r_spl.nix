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
  r2r_spl_test_interfaces,
  rclpy,
  rosidl_parser,
  substituteSource,
}:
let
  sources = rec {
    r2r_spl = substituteSource {
      src = fetchgit {
        name = "r2r_spl-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "12ce7358216124da35c6b45b592bc0d58f578b60";
        hash = "sha256-pUKEkfSPujNcwIJ5+ffHjCHn71LoGUKQh0YgGjyKoH0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "r2r_spl";
  version = "2.1.0-1";
  src = sources.r2r_spl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ rosidl_parser ];
  buildInputs = [  ];
  propagatedBuildInputs = [ game_controller_spl_interfaces python3Packages.construct rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
