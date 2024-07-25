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
        rev = "28fb3d7d11f2167ea52c6968256958a2eb45d0d1";
        hash = "sha256-dm1psyuV0pFw4lLrVBcz/ElZ/T+49Lqaf1kDqahOvLs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "perception";
  version = "0.11.0-1";
  src = sources.perception;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ image_common image_pipeline image_transport_plugins laser_filters laser_geometry perception_pcl ros_base vision_opencv ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}