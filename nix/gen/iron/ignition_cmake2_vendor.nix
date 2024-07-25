{
  ament_cmake_copyright,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_xmllint,
  buildRosPackage,
  cmake,
  doxygen,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  substituteSource,
}:
let
  sources = rec {
    ignition_cmake2_vendor = substituteSource {
      src = fetchgit {
        name = "ignition_cmake2_vendor-source";
        url = "https://github.com/ros2-gbp/gz_cmake2_vendor-release.git";
        rev = "0ad8821ccb6cbc81e38217e3d7de5c46cfb2dfed";
        hash = "sha256-MUT8kZbTQdnGitDZ7gA/aCY+6J6S816ek6MDpPcijPU=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/ignitionrobotics/ign-cmake.git";
          to = "URL ${ignition_cmake2_vendor-vendor_source-ign-cmake-0}";
        }
      ];
    };
    ignition_cmake2_vendor-vendor_source-ign-cmake-0 = substituteSource {
      src = fetchgit {
        name = "ignition_cmake2_vendor-vendor_source-ign-cmake-0-source";
        url = "https://github.com/ignitionrobotics/ign-cmake.git";
        rev = "d9a33bfc11a3e49c8d15e9ba7d880aaaaf7e106d";
        hash = "sha256-23QwqdBBKNB/Q/6e2aitWZ433FFfhpIfbm9jvEiKNG8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ignition_cmake2_vendor";
  version = "0.1.0-2";
  src = sources.ignition_cmake2_vendor;
  nativeBuildInputs = [ ament_cmake_test cmake doxygen git ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
