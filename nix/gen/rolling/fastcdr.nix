{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    fastcdr = substituteSource {
      src = fetchgit {
        name = "fastcdr-source";
        url = "https://github.com/ros2-gbp/fastcdr-release.git";
        rev = "fb035fb13def102d000900aa44f1d244688409ba";
        hash = "sha256-/KJcVY0p1qX56K44c6u5ZwcgzQHKUcHmqTeBWyZTyes=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fastcdr";
  version = "2.2.2-1";
  src = sources.fastcdr;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
