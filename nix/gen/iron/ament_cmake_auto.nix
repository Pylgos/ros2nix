{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_auto = substituteSource {
      src = fetchgit {
        name = "ament_cmake_auto-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "00c720dd1e76fe3a0938014048a61331016b676f";
        hash = "sha256-quWMslkwbnwRcsPZ/eJOwMWreM3CKqv1OI9vo/Bh7jA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_auto";
  version = "2.0.5-1";
  src = sources.ament_cmake_auto;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake ament_cmake_gtest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake ament_cmake_gtest ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
