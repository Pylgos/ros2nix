{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_core,
  flexbe_msgs,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    flexbe_mirror = substituteSource {
      src = fetchgit {
        name = "flexbe_mirror-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "5bb05f361ae1d8bf34069dd12344036a73f8fa6a";
        hash = "sha256-1eccL9zmzsU8IdT2df4ku0ye7yVGIi1S4Tgd+s28MjI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_mirror";
  version = "2.3.5-1";
  src = sources.flexbe_mirror;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
