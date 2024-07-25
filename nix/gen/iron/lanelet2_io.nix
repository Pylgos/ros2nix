{
  ament_cmake_core,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gtest,
  lanelet2_core,
  mrt_cmake_modules,
  pugixml,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    lanelet2_io = substituteSource {
      src = fetchgit {
        name = "lanelet2_io-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "7fc2e40eab69353445114094375cdce6a4b391ce";
        hash = "sha256-mW8p1j9qBuv8wPpmUu1kWNNJb7+pngf70mRvO8NciSc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "lanelet2_io";
  version = "1.1.1-5";
  src = sources.lanelet2_io;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ mrt_cmake_modules ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lanelet2_core pugixml python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
