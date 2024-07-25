{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    gazebo_dev = substituteSource {
      src = fetchgit {
        name = "gazebo_dev-source";
        url = "https://github.com/ros2-gbp/gazebo_ros_pkgs-release.git";
        rev = "a8d656f7e701afdc484024ef6dec40ae0d60c38e";
        hash = "sha256-mrueslrQTjk6YEdaHeKosgUwED/y28Lamkk7Xu2FW8Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gazebo_dev";
  version = "3.7.0-1";
  src = sources.gazebo_dev;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
