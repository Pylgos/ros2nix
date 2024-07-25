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
        rev = "357a3e2a68d482c95957dee95f13d687d0a57388";
        hash = "sha256-DNRtdZIrgSCtlEt8SWGleDHkhhCzLqy4SRy5tnLeH+Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rcgcd_spl_14_conversion";
  version = "2.1.0-1";
  src = sources.rcgcd_spl_14_conversion;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.construct rcgcd_spl_14 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
