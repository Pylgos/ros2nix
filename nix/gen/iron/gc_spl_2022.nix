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
        rev = "b346e84e940a67fa6c225f590712460dce7c8f28";
        hash = "sha256-bOTwR1b7PB9sppCFzoCAJvkCsKIgnF3R1nMaGp5H9EI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gc_spl_2022";
  version = "3.1.0-1";
  src = sources.gc_spl_2022;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcgcd_spl_14 rcgcd_spl_14_conversion rcgcrd_spl_4 rcgcrd_spl_4_conversion rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
