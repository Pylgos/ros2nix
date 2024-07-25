{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    schunk_svh_description = substituteSource {
      src = fetchgit {
        name = "schunk_svh_description-source";
        url = "https://github.com/ros2-gbp/schunk_svh_ros_driver-release.git";
        rev = "85f4ed9a3a249097bba6baf98a9c4f7e8cf225b3";
        hash = "sha256-4N10izt0TwDo+3URnpQhoTsQlxdGczrItB3ZVf/opWk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "schunk_svh_description";
  version = "2.1.1-1";
  src = sources.schunk_svh_description;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
