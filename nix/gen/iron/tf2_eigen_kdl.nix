{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  orocos_kdl_vendor,
  substituteSource,
  tf2,
}:
let
  sources = rec {
    tf2_eigen_kdl = substituteSource {
      src = fetchgit {
        name = "tf2_eigen_kdl-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "ef0966ad2abe5febadfdbe84048ba17e234da730";
        hash = "sha256-S7/aCWTsn/3foFYQB+OhB6ADqGcX92b+KpQ0498iw9I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "tf2_eigen_kdl";
  version = "0.31.7-1";
  src = sources.tf2_eigen_kdl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen orocos_kdl_vendor tf2 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
