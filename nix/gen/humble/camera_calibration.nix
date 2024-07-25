{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_geometry,
  message_filters,
  python3Packages,
  rclpy,
  sensor_msgs,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    camera_calibration = substituteSource {
      src = fetchgit {
        name = "camera_calibration-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "5f0105730001517214088eb15dd2967d2845f077";
        hash = "sha256-OgpLDFT3HKKCCmIna54p2qAYvk3YRKU5qfMFwF5ggdg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_calibration";
  version = "3.0.4-1";
  src = sources.camera_calibration;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_geometry message_filters rclpy sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
