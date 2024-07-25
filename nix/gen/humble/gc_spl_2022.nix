{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcgcd_spl_14,
  rcgcd_spl_14_conversion,
  rcgcrd_spl_4,
  rcgcrd_spl_4_conversion,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    gc_spl_2022 = substituteSource {
      src = fetchgit {
        name = "gc_spl_2022-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "01e536e831329ebcf3a63b44c153838b0765bf1b";
        hash = "sha256-4vz+libmGESb4uJeOhtAX37lGt19QMaCACH9Q23Y3eU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gc_spl_2022";
  version = "2.1.0-1";
  src = sources.gc_spl_2022;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcgcd_spl_14 rcgcd_spl_14_conversion rcgcrd_spl_4 rcgcrd_spl_4_conversion rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
