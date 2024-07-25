{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mola_pose_list,
  mola_test_datasets,
  mp2p_icp,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_relocalization = substituteSource {
      src = fetchgit {
        name = "mola_relocalization-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "09c9e7d8657f031450e6798482f661c7abd5944a";
        hash = "sha256-DKJZen9gJKTp1AHQHbhz7W1I3qyZ4noxY3W4xysYpwU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_relocalization";
  version = "1.0.6-1";
  src = sources.mola_relocalization;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mola_pose_list mola_test_datasets mp2p_icp mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
