{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rmw_connextdds_common,
  substituteSource,
}:
let
  sources = rec {
    rmw_connextdds = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "c942a497e3df68478b5b817ddd53059b5d2a6d72";
        hash = "sha256-i40VtSIFjgH3019vFNT8rz+oSGPmRwAj+F/XKTd4wnI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_connextdds";
  version = "0.24.0-1";
  src = sources.rmw_connextdds;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [ ament_cmake ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rmw_connextdds_common ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
