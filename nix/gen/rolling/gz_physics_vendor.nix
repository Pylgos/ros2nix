{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_vendor_package,
  ament_cmake_xmllint,
  buildRosPackage,
  bullet,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  gbenchmark,
  gz_cmake_vendor,
  gz_common_vendor,
  gz_dartsim_vendor,
  gz_math_vendor,
  gz_plugin_vendor,
  gz_utils_vendor,
  sdformat_vendor,
  substituteSource,
}:
let
  sources = rec {
    gz_physics_vendor = substituteSource {
      src = fetchgit {
        name = "gz_physics_vendor-source";
        url = "https://github.com/ros2-gbp/gz_physics_vendor-release.git";
        rev = "55bfa879f4fe078ec1ddf137ec5bce0140b4a4ec";
        hash = "sha256-aaUz3V2ZxjdyShxacCQdBEZnfJlHPlCWvmDoKmvP9kI=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/gazebosim/\${GITHUB_NAME}.git";
          to = "VCS_TYPE path VCS_URL ${gz_physics_vendor-vendor_source-gz-physics-0}";
        }
      ];
    };
    gz_physics_vendor-vendor_source-gz-physics-0 = substituteSource {
      src = fetchgit {
        name = "gz_physics_vendor-vendor_source-gz-physics-0-source";
        url = "https://github.com/gazebosim/gz-physics.git";
        rev = "bcacf85e3e25961263725f424191027951a03430";
        hash = "sha256-vDO/QTiSF/yrDilr/4vGj/yEXraACl+TIS91phgMN7s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_physics_vendor";
  version = "0.1.0-1";
  src = sources.gz_physics_vendor;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_test ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ gbenchmark ];
  buildInputs = [  ];
  propagatedBuildInputs = [ bullet eigen gz_cmake_vendor gz_common_vendor gz_dartsim_vendor gz_math_vendor gz_plugin_vendor gz_utils_vendor sdformat_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
