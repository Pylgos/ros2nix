{
  ament_cmake_core,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_catch2 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_catch2-source";
        url = "https://github.com/ros2-gbp/ament_cmake_catch2-release.git";
        rev = "99c9bf4fa0edf16c1ea0099598cf03eeb6793d6b";
        hash = "sha256-PFP5trdCmO4MmGg8CFeK0nTgMWRn+XQN2Z92TWyddYk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_catch2";
  version = "1.4.1-1";
  src = sources.ament_cmake_catch2;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}