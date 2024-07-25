{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  git,
  orocos-kdl,
  substituteSource,
}:
let
  sources = rec {
    orocos_kdl_vendor = substituteSource {
      src = fetchgit {
        name = "orocos_kdl_vendor-source";
        url = "https://github.com/ros2-gbp/orocos_kdl_vendor-release.git";
        rev = "548edb0faa1c0e6faa4e6095fa7b588ae344614e";
        hash = "sha256-8878heWJ0CVI+sqZ4A7SwqJ76ZnDqkCzmA/OPn7Ahk8=";
      };
      substitutions = [
        {
          path = "CMakeLists.txt";
          from = "GIT_REPOSITORY https://github.com/orocos/orocos_kinematics_dynamics.git";
          to = "URL ${orocos_kdl_vendor-vendor_source-orocos_kinematics_dynamics-0}";
        }
      ];
    };
    orocos_kdl_vendor-vendor_source-orocos_kinematics_dynamics-0 = substituteSource {
      src = fetchgit {
        name = "orocos_kdl_vendor-vendor_source-orocos_kinematics_dynamics-0-source";
        url = "https://github.com/orocos/orocos_kinematics_dynamics.git";
        rev = "507de66205e14b12c8c65f25eafc05c4dc66e21e";
        hash = "sha256-noKuZn6aXbM5Q1jSaIj21BjOnZCzcSLVDaUp0iz1X60=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "orocos_kdl_vendor";
  version = "0.3.4-3";
  src = sources.orocos_kdl_vendor;
  nativeBuildInputs = [ ament_cmake git ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen orocos-kdl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
