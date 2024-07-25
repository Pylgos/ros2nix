{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  asio,
  buildPackages,
  buildRosPackage,
  console-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mavlink,
  substituteSource,
}:
let
  sources = rec {
    libmavconn = substituteSource {
      src = fetchgit {
        name = "libmavconn-source";
        url = "https://github.com/ros2-gbp/mavros-release.git";
        rev = "a00f3267e9f66edf3ecd4c15d915a6fa04994a89";
        hash = "sha256-QBritO4WHraRumwSo3Zp7pZ16Sj5xlwZNFNpMxUNM3M=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "libmavconn";
  version = "2.8.0-1";
  src = sources.libmavconn;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.empy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ asio console-bridge mavlink ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}