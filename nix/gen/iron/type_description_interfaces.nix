{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_core_generators,
  rosidl_core_runtime,
  service_msgs,
  substituteSource,
}:
let
  sources = rec {
    type_description_interfaces = substituteSource {
      src = fetchgit {
        name = "type_description_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "09045a82c9ea8a620b34533bbb8135db266d15e0";
        hash = "sha256-1kYC2pyGZFvM5Tj9UifvVySvAgAteeVzogxMMTM041k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "type_description_interfaces";
  version = "1.6.0-2";
  src = sources.type_description_interfaces;
  nativeBuildInputs = [ ament_cmake rosidl_core_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_core_runtime service_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
