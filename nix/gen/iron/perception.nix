{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image_common,
  image_pipeline,
  image_transport_plugins,
  laser_filters,
  laser_geometry,
  perception_pcl,
  ros_base,
  substituteSource,
  vision_opencv,
}:
let
  sources = rec {
    perception = substituteSource {
      src = fetchgit {
        name = "perception-source";
        url = "https://github.com/ros2-gbp/variants-release.git";
        rev = "707bc7fe671c15cd6945aa6aed4a034b727b36f4";
        hash = "sha256-c9lGVLwPCuMSbgiHggs37sSu7II5YKdn0ruTBwk2wMs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "perception";
  version = "0.10.0-3";
  src = sources.perception;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ image_common image_pipeline image_transport_plugins laser_filters laser_geometry perception_pcl ros_base vision_opencv ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
