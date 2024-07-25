{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
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
    velodyne_msgs = substituteSource {
      src = fetchgit {
        name = "velodyne_msgs-source";
        url = "https://github.com/ros2-gbp/velodyne-release.git";
        rev = "e9849c9be82195b8d27bbe5f6ea81b24cd6aa3fd";
        hash = "sha256-QH84FDfTm+iuKEzzwWQ/PXJ34O9FF4Y4ZYR6mF7Pl2c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velodyne_msgs";
  version = "2.4.0-1";
  src = sources.velodyne_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}