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
        rev = "01c1799e7375f9b52075793fad1b5f4b632a3b74";
        hash = "sha256-vyRxq6EM6nOhjwQFIV+ikGPs5Wr0pb7e9iAq8+R8cwo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "smach";
  version = "3.0.3-2";
  src = sources.smach;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
