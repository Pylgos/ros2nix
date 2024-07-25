{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pcl_conversions,
  pcl_msgs,
  pcl_ros,
  substituteSource,
}:
let
  sources = rec {
    perception_pcl = substituteSource {
      src = fetchgit {
        name = "perception_pcl-source";
        url = "https://github.com/ros2-gbp/perception_pcl-release.git";
        rev = "c217470d731c3873f341d21680d7f0794c1f29a2";
        hash = "sha256-vaelynEY5Nl6dBCMHgjnRIcRRl4Em53DNQIvwfmo36A=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "perception_pcl";
  version = "2.4.0-6";
  src = sources.perception_pcl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pcl_conversions pcl_msgs pcl_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
