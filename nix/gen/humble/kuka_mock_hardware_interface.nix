{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  substituteSource,
}:
let
  sources = rec {
    kuka_mock_hardware_interface = substituteSource {
      src = fetchgit {
        name = "kuka_mock_hardware_interface-source";
        url = "https://github.com/ros2-gbp/kuka_robot_descriptions-release.git";
        rev = "ba6d65de74094e2cf73a8633a6e4ff1b69872bb8";
        hash = "sha256-irfOSqXq+Bp0x/QSwjbG+Mmk8Ag0pfhhRdsnhBt2SxE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kuka_mock_hardware_interface";
  version = "0.9.0-2";
  src = sources.kuka_mock_hardware_interface;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ hardware_interface pluginlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
