{
  ament_cmake,
  ament_cmake_python,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    smach = substituteSource {
      src = fetchgit {
        name = "smach-source";
        url = "https://github.com/ros2-gbp/executive_smach-release.git";
        rev = "b15e2d1392843c513a463dce44ef17bf45b1c103";
        hash = "sha256-vyRxq6EM6nOhjwQFIV+ikGPs5Wr0pb7e9iAq8+R8cwo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smach";
  version = "3.0.3-3";
  src = sources.smach;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
