{
  ament_cmake,
  buildRosPackage,
  builtin_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  substituteSource,
}:
let
  sources = rec {
    pendulum_msgs = substituteSource {
      src = fetchgit {
        name = "pendulum_msgs-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "9d0bcdafdb8a3dcbeb6e7b45efc737cdd1bec64b";
        hash = "sha256-3HCTFXwEG4Bk30pQdeQDNuVwYFz+oFyEKczS3Q34cYI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pendulum_msgs";
  version = "0.20.4-1";
  src = sources.pendulum_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ builtin_interfaces rosidl_default_runtime ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
