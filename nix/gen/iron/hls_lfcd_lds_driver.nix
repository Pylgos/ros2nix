{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclcpp,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    hls_lfcd_lds_driver = substituteSource {
      src = fetchgit {
        name = "hls_lfcd_lds_driver-source";
        url = "https://github.com/ros2-gbp/hls_lfcd_lds_driver-release.git";
        rev = "e4be907c68131e746da4996c77dc745982cdee47";
        hash = "sha256-gFslT2HGpW6SzRM8frU8D/gistcJDw02YkcZTXZcfa8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hls_lfcd_lds_driver";
  version = "2.0.4-5";
  src = sources.hls_lfcd_lds_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.boost rclcpp sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
