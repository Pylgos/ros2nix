{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcgcrd_spl_4,
  substituteSource,
}:
let
  sources = rec {
    rcgcrd_spl_4_conversion = substituteSource {
      src = fetchgit {
        name = "rcgcrd_spl_4_conversion-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "a65669a3d34fcede49a97314dc05151bb336416f";
        hash = "sha256-rZmhPLOqFPkMb87piVTkNCiLrsCRtHDkEuLuUpq9QO8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcrd_spl_4_conversion";
  version = "2.1.0-1";
  src = sources.rcgcrd_spl_4_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct rcgcrd_spl_4 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
