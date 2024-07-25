{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_xmllint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cmake,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    mola_demos = substituteSource {
      src = fetchgit {
        name = "mola_demos-source";
        url = "https://github.com/ros2-gbp/mola-release.git";
        rev = "72a81d4646b7e8373ce8d83ca8aa6dfce338e9ae";
        hash = "sha256-XrTSbNh3tlYbur782MaGRByYapPhDBmO9/GTLgwHgWE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mola_demos";
  version = "1.0.6-1";
  src = sources.mola_demos;
  nativeBuildInputs = [ ament_cmake ament_cmake_gtest cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_xmllint ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
