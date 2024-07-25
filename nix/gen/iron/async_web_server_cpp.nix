{
  ament_cmake_ros,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  openssl,
  python3Packages,
  substituteSource,
}:
let
  sources = rec {
    async_web_server_cpp = substituteSource {
      src = fetchgit {
        name = "async_web_server_cpp-source";
        url = "https://github.com/ros2-gbp/async_web_server_cpp-release.git";
        rev = "4f1e3dadd9eee5dce85158e45c7e95c0b93557c2";
        hash = "sha256-bz0je03yD60CjR08T++F1rGD5GhfXZJWAbL6L5rINbo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "async_web_server_cpp";
  version = "2.0.0-5";
  src = sources.async_web_server_cpp;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ openssl python3Packages.boost ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}