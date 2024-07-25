{
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    osrf_testing_tools_cpp = substituteSource {
      src = fetchgit {
        name = "osrf_testing_tools_cpp-source";
        url = "https://github.com/ros2-gbp/osrf_testing_tools_cpp-release.git";
        rev = "9ed6c1929ba2c9ad896e898dc92f3d0aaf758ae6";
        hash = "sha256-du4lfHqdmHOrL+pPJsvjMzkstRUrj//VqIabWR6SP2Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "osrf_testing_tools_cpp";
  version = "1.5.2-1";
  src = sources.osrf_testing_tools_cpp;
  nativeBuildInputs = [ cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
