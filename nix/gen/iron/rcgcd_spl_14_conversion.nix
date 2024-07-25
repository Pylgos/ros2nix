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
  substituteSource,
}:
let
  sources = rec {
    rcgcd_spl_14_conversion = substituteSource {
      src = fetchgit {
        name = "rcgcd_spl_14_conversion-source";
        url = "https://github.com/ros2-gbp/game_controller_spl-release.git";
        rev = "a9e3151bcbf96a0a0c52e687ad261183771c8c58";
        hash = "sha256-rFyvRz6+t7ZfWPa3cY2YIlut02RqkuDYwbHbilZqUJE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcd_spl_14_conversion";
  version = "3.1.0-1";
  src = sources.rcgcd_spl_14_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct rcgcd_spl_14 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
