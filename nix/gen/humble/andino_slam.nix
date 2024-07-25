{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  slam_toolbox,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    andino_slam = substituteSource {
      src = fetchgit {
        name = "andino_slam-source";
        url = "https://github.com/ros2-gbp/andino-release.git";
        rev = "8d9d38bdc061b52dec34f852bdec68a0e633e5b9";
        hash = "sha256-QPmWV/tE4v7XDJExHnkxib8Tl7Kkooy8Lv9O0kqzNh8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "andino_slam";
  version = "0.1.0-1";
  src = sources.andino_slam;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ slam_toolbox ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
