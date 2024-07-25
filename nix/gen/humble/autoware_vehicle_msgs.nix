{
  ament_cmake_auto,
  ament_lint_auto,
  ament_lint_common,
  autoware_planning_msgs,
  buildRosPackage,
  builtin_interfaces,
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
    autoware_vehicle_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_vehicle_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_msgs-release.git";
        rev = "2e0f8b06a4e1ff832a2b5b700570538c8cbea1ed";
        hash = "sha256-6aO0NolqbPRlwrCNG4AgviUdoV/VJBIl8qrwZw9uYfw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_vehicle_msgs";
  version = "1.1.0-1";
  src = sources.autoware_vehicle_msgs;
  nativeBuildInputs = [ ament_cmake_auto rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ autoware_planning_msgs builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
