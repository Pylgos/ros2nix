{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclpy,
  social_nav_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    social_nav_util = substituteSource {
      src = fetchgit {
        name = "social_nav_util-source";
        url = "https://github.com/ros2-gbp/social_nav_ros-release.git";
        rev = "62b977d1b4cfa9d15417214e1724b2ca44318579";
        hash = "sha256-+7PgahOBtkCFWxygPuSiDz8SKpmpSxOpBSIcBJLNN6s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "social_nav_util";
  version = "0.1.0-1";
  src = sources.social_nav_util;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclpy social_nav_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
