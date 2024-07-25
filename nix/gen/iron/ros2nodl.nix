{
  ament_flake8,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  ament_mypy,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  nodl_python,
  python3Packages,
  ros2cli,
  ros2pkg,
  ros2run,
  substituteSource,
}:
let
  sources = rec {
    ros2nodl = substituteSource {
      src = fetchgit {
        name = "ros2nodl-source";
        url = "https://github.com/ros2-gbp/nodl-release.git";
        rev = "b2ed865a8f3c4f9c83eec6de3b9749dd66195d71";
        hash = "sha256-8JQgseO9AxfsDy2YuxQ/dojS/6MOLaCKwBGUX8hIgwk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2nodl";
  version = "0.3.1-4";
  src = sources.ros2nodl;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_index_python buildPackages.python3Packages.argcomplete ];
  buildInputs = [  ];
  propagatedBuildInputs = [ nodl_python ros2cli ros2pkg ros2run ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
