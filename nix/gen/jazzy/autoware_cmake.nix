{
  ament_cmake_auto,
  ament_lint_auto,
  autoware_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    autoware_cmake = substituteSource {
      src = fetchgit {
        name = "autoware_cmake-source";
        url = "https://github.com/ros2-gbp/autoware_cmake-release.git";
        rev = "f180036d1d4661a5758129e22e5c74375308e6d8";
        hash = "sha256-uNWJEFHdKrWaAM3S5MTv2SI5xia8uBU4BdoPu0+jjpc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_cmake";
  version = "1.0.0-1";
  src = sources.autoware_cmake;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_auto ament_lint_auto ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_auto ament_lint_auto ros_environment ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}