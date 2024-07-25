{
  ament_cmake_auto,
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
    autoware_adapi_version_msgs = substituteSource {
      src = fetchgit {
        name = "autoware_adapi_version_msgs-source";
        url = "https://github.com/ros2-gbp/autoware_adapi_msgs-release.git";
        rev = "f8e907a37dc64565bdcfc3b1f1336cac4f038575";
        hash = "sha256-q8EbPhpC5WYidH72USs7dvCwus3YHdH9cvNUEwd4TB4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "autoware_adapi_version_msgs";
  version = "1.2.1-1";
  src = sources.autoware_adapi_version_msgs;
  nativeBuildInputs = [ ament_cmake_auto ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
