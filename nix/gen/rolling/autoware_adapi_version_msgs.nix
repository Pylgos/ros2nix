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
        rev = "758c1d5975ee82e38181533c4b824a7ad1ebcc11";
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
