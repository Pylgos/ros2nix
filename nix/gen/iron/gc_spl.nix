{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gc_spl_interfaces,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    gc_spl = substituteSource {
      src = fetchgit {
        name = "gc_spl-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "23a6d5af567aa9be33125b91d42350426ebb09aa";
        hash = "sha256-HxUhpkkWNkI2U4bJb899Eqpw1hxFfrOXN6uUByDh9Z8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gc_spl";
  version = "3.1.0-1";
  src = sources.gc_spl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gc_spl_interfaces python3Packages.construct rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
