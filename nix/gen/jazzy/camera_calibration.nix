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
        rev = "a964e757e664522d9a441d9fb17b69c2b5a3ac1e";
        hash = "sha256-GnCTurK+9iApYh6ffx9YFcmNN4Vu81kICyOpETIPGPM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "camera_calibration";
  version = "5.0.1-3";
  src = sources.camera_calibration;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ cv_bridge image_geometry message_filters python3Packages.opencv4 rclpy sensor_msgs std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
