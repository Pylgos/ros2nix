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
    flexbe_input = substituteSource {
      src = fetchgit {
        name = "flexbe_input-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "8c956bb2fb52ae4cb31feae6f7f5bf461310c5f3";
        hash = "sha256-nn9Wgb53sj+Ux0OyzffUHBvhYh+08yQH8omaiq0irEA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_input";
  version = "3.0.2-1";
  src = sources.flexbe_input;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
