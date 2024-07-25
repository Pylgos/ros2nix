{
  ament_cmake,
  ament_cmake_vendor_package,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  orocos-kdl,
  substituteSource,
}:
let
  sources = rec {
    orocos_kdl_vendor = substituteSource {
      src = fetchgit {
        name = "orocos_kdl_vendor-source";
        url = "https://github.com/ros2-gbp/orocos_kdl_vendor-release.git";
        rev = "cdb25798979b61d7591030abc06923438eaf990c";
        hash = "sha256-UMCjg5ol7D43QHfQX9G3elox5GLUsHb5Q93TExrjorc=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "VCS_URL https://github.com/orocos/orocos_kinematics_dynamics.git";
          to = "VCS_TYPE path VCS_URL ${orocos_kdl_vendor-vendor_source-orocos_kinematics_dynamics-0}";
        }
      ];
    };
    orocos_kdl_vendor-vendor_source-orocos_kinematics_dynamics-0 = substituteSource {
      src = fetchgit {
        name = "orocos_kdl_vendor-vendor_source-orocos_kinematics_dynamics-0-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics.git";
        rev = "ce4bcb65a050615b6d7f21bc60fbb2656515791b";
        hash = "sha256-CfmwMQEg/tRVNaGglBZ94pBwva49mJJwkbSjhqzG2Pw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "orocos_kdl_vendor";
  version = "0.6.1-1";
  src = sources.orocos_kdl_vendor;
  nativeBuildInputs = [ ament_cmake ament_cmake_vendor_package ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen orocos-kdl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
