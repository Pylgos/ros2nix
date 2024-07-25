{
  ament_cmake,
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
    clearpath_platform_msgs = substituteSource {
      src = fetchgit {
        name = "clearpath_platform_msgs-source";
        url = "https://github.com/clearpath-gbp/clearpath_msgs-release.git";
        rev = "4ab23086c6dd0e79e69bccb94bd9e9e180b3553d";
        hash = "sha256-6GpkSMPgVVk8PU8kNUAcznAZz+wANtpSbp/pOxoJ4u4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "clearpath_platform_msgs";
  version = "0.2.0-1";
  src = sources.clearpath_platform_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
