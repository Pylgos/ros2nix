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
    raspimouse_msgs = substituteSource {
      src = fetchgit {
        name = "raspimouse_msgs-source";
        url = "https://github.com/ros2-gbp/raspimouse2-release.git";
        rev = "4f6c5aec3e24871395f59615d0394067ed76fccb";
        hash = "sha256-2eZkV3e9FJfSFdaYJDNTjhBd1AdoY7oPVNxG4PW8c2w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "raspimouse_msgs";
  version = "1.1.2-1";
  src = sources.raspimouse_msgs;
  nativeBuildInputs = [ ament_cmake rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
