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
        rev = "6da5dd8ce2ca5e76ab1cc17f3c15e80e12d57222";
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
