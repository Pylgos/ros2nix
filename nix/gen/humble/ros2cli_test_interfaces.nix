{
  action_msgs,
  ament_cmake,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    ros2cli_test_interfaces = substituteSource {
      src = fetchgit {
        name = "ros2cli_test_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "4ca50ea24322064b4c4b856630a05132697379f8";
        hash = "sha256-KgkVJbIsWZoD/titXZ9UO3yPB58IwCkq1cAHSAFVIyE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2cli_test_interfaces";
  version = "0.18.10-1";
  src = sources.ros2cli_test_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
