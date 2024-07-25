{
  ament_cmake,
  buildRosPackage,
  etsi_its_cam_coding,
  etsi_its_denm_coding,
  fetchgit,
  fetchurl,
  fetchzip,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    etsi_its_coding = substituteSource {
      src = fetchgit {
        name = "etsi_its_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "bdc3a8b9e4cfd8e8c108e0f2855af209ae4340e8";
        hash = "sha256-5GfA1H1WwNYYVFNXYBiK8Yb9xhzkiiOc7v/4SO+LQcI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "etsi_its_coding";
  version = "2.0.2-1";
  src = sources.etsi_its_coding;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ etsi_its_cam_coding etsi_its_denm_coding ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
