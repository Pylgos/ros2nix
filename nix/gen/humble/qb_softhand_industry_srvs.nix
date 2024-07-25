{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  qb_softhand_industry_msgs,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    qb_softhand_industry_srvs = substituteSource {
      src = fetchgit {
        name = "qb_softhand_industry_srvs-source";
        url = "https://bitbucket.org/qbrobotics/qbshin-ros2-release.git";
        rev = "7998686966ad5604282722ec41a3fa1afc5c341b";
        hash = "sha256-7X5ydCWmexGPkAeLms6c0mw841kkYBgdKDUTGNVI2TU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "qb_softhand_industry_srvs";
  version = "2.1.2-4";
  src = sources.qb_softhand_industry_srvs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ qb_softhand_industry_msgs rosidl_default_runtime std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
