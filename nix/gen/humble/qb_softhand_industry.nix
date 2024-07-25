{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qb_softhand_industry_description,
  qb_softhand_industry_driver,
  qb_softhand_industry_ros2_control,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    qb_softhand_industry = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "7f70e9316d899a3c01a15f48147697ed73bdd8e7";
        hash = "sha256-GMI9hhacVE8JBRv5wVlilviZgb1xQJjjAAvNg2dQUqw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_softhand_industry";
  version = "2.1.2-4";
  src = sources.qb_softhand_industry;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qb_softhand_industry_description qb_softhand_industry_driver qb_softhand_industry_ros2_control ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
