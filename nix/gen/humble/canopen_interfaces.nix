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
  substituteSource,
}:
let
  sources = rec {
    canopen_interfaces = substituteSource {
      src = fetchgit {
        name = "canopen_interfaces-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "42216ecadfb64006cf98b92cb5854e9aa626ab52";
        hash = "sha256-C6pPopHEYUllOI3dN4gOOf6GpQqYe7s9if510+S3TNo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_interfaces";
  version = "0.2.11-2";
  src = sources.canopen_interfaces;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
