{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rt_manipulators_cpp,
  substituteSource,
}:
let
  sources = rec {
    rt_manipulators_examples = substituteSource {
      src = fetchgit {
        name = "rt_manipulators_examples-source";
        url = "https://github.com/ros2-gbp/rt_manipulators_cpp-release.git";
        rev = "98e27025baea54bbdd1867df4b4134313a165324";
        hash = "sha256-dHVhmshZaD7z/hfD5tLkvXw6mehXEQSlivgKwLZ4YZM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rt_manipulators_examples";
  version = "1.0.0-1";
  src = sources.rt_manipulators_examples;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rt_manipulators_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
