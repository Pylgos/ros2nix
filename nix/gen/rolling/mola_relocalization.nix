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
        rev = "13f7f8dd788006dfe46e341a068139bedf7de40f";
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
