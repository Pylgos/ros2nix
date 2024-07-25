{
  ament_cmake_core,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  mrt_cmake_modules,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_core = substituteSource {
      src = fetchgit {
        name = "lanelet2_core-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "a0f85e219c4e9fc2fc217874371d92ec1fba0a56";
        hash = "sha256-NpBQJ/brNiWnlLzVj16s4Xq257hkZ+PCNAudtWfEkks=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_core";
  version = "1.1.1-5";
  src = sources.lanelet2_core;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
