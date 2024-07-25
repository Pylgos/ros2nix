{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  mola_common,
  mrpt2,
  substituteSource,
}:
let
  sources = rec {
    mola_pose_list = substituteSource {
      src = fetchgit {
        name = "mola_pose_list-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "39cd2d6c99c1b1225c9aa76ffa9cc5848fadb1f7";
        hash = "sha256-lErQqkdThV+fJ59Zh+5l10r8O7bwQibb74FoH8jZu2c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_pose_list";
  version = "1.0.6-1";
  src = sources.mola_pose_list;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mola_common mrpt2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}