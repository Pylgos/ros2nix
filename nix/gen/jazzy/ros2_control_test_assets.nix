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
    ros2_control_test_assets = substituteSource {
      src = fetchgit {
        name = "ros2_control_test_assets-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "6c0fcda76bf3d5d8a84a884c1edbd4be996d3be0";
        hash = "sha256-GHFpNe97l1QM43jb2vBMx/h75I47/8L8uQdXBSDylX8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2_control_test_assets";
  version = "4.11.0-1";
  src = sources.ros2_control_test_assets;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
