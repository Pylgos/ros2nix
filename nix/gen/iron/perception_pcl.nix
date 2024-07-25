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
        rev = "222f531e4eb5f2a1d218c4f7a18975c595aee905";
        hash = "sha256-jGV16TqAGP+5JuqSEPnvPmE+zHgUCYYoqVPRR7kZdZY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "perception_pcl";
  version = "2.5.4-1";
  src = sources.perception_pcl;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pcl_conversions pcl_msgs pcl_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
