{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rosidl_default_generators,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    microstrain_inertial_msgs = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_msgs-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "aabed5a9c0cb80eed8327649d988f57185cb36e4";
        hash = "sha256-PeKXv1/tOxe0ML45M74+JehJ/xq8DuPKe1yVSVEhXOY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "microstrain_inertial_msgs";
  version = "4.3.0-1";
  src = sources.microstrain_inertial_msgs;
  nativeBuildInputs = [ rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
