{
  ament_cmake,
  ament_cmake_gen_version_h,
  ament_cmake_gmock,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    transmission_interface = substituteSource {
      src = fetchgit {
        name = "transmission_interface-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "4d3ffa6e7fe7b744cbfa94d4a0ebd097c44cb085";
        hash = "sha256-F4aP5t3jqtAGcg0UTo8TB2zwDWG6NjCAyPJE3ij7Onw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "transmission_interface";
  version = "4.12.0-1";
  src = sources.transmission_interface;
  nativeBuildInputs = [ ament_cmake ament_cmake_gen_version_h ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hardware_interface pluginlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
