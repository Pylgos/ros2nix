{
  ament_cmake,
  ament_cmake_core,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  rclcpp,
  rclcpp_components,
  substituteSource,
}:
let
  sources = rec {
    generate_parameter_library_example = substituteSource {
      src = fetchgit {
        name = "generate_parameter_library_example-source";
        url = "https://github.com/ros2-gbp/generate_parameter_library-release.git";
        rev = "86f25e85bf74870abdf2cd77a4d59039a48a6284";
        hash = "sha256-d0nHulgcdsijc/fqux0zSYWVUPWx2mS9mWEa+PpXhtM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "generate_parameter_library_example";
  version = "0.3.8-3";
  src = sources.generate_parameter_library_example;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_core ];
  buildInputs = [  ];
  propagatedBuildInputs = [ generate_parameter_library rclcpp rclcpp_components ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
