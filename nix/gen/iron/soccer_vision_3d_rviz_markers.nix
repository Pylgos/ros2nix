{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  soccer_vision_3d_msgs,
  soccer_vision_attribute_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    soccer_vision_3d_rviz_markers = substituteSource {
      src = fetchgit {
        name = "soccer_vision_3d_rviz_markers-source";
        url = "https://github.com/ros2-gbp/soccer_vision_3d_rviz_markers-release.git";
        rev = "7c2d31c178e08dec6745dc2a647eda301fa328c1";
        hash = "sha256-YW0dc1eNI0N0JgIafCnbx1WMqbHYzCcN2GoaXg0/ga4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "soccer_vision_3d_rviz_markers";
  version = "0.1.0-1";
  src = sources.soccer_vision_3d_rviz_markers;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy soccer_vision_3d_msgs soccer_vision_attribute_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
