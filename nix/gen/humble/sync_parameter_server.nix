{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rcl_interfaces,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    sync_parameter_server = substituteSource {
      src = fetchgit {
        name = "sync_parameter_server-source";
        url = "https://github.com/ros2-gbp/sync_parameter_server-release.git";
        rev = "f1d7c5b3de4b01bc9e9c7352ef140d37bcc41d9a";
        hash = "sha256-9d5pLkPiIKKcrsVcYk+NFqUDirh9oGWA/R6eLnManSk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sync_parameter_server";
  version = "1.0.1-2";
  src = sources.sync_parameter_server;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_interfaces rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
