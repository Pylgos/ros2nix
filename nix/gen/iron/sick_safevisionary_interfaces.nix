{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    sick_safevisionary_interfaces = substituteSource {
      src = fetchgit {
        name = "sick_safevisionary_interfaces-source";
        url = "https://github.com/ros2-gbp/sick_safevisionary_ros2-release.git";
        rev = "1cbb7f15d7bd3a98912a6befb9ff3986a708cc04";
        hash = "sha256-7qiJXkBhZMJSxhYrVSgDCUBskK0DEX4aQAixkvpRaP4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "sick_safevisionary_interfaces";
  version = "1.0.3-1";
  src = sources.sick_safevisionary_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
