{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    qb_softhand_industry_description = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry_description-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "6a474565d6f7dc0a25ebf7ec57dc70d9ef7a255a";
        hash = "sha256-LXdqYohauCVZHV2ZZDyPIBUIIZNzTxy8MgoQDtV1om0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_softhand_industry_description";
  version = "2.1.2-4";
  src = sources.qb_softhand_industry_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
