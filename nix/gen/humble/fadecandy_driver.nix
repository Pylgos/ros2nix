{
  ament_cmake,
  buildRosPackage,
  diagnostic_updater,
  fadecandy_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  libusb1,
  pkg-config,
  rclcpp,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    fadecandy_driver = substituteSource {
      src = fetchgit {
        name = "fadecandy_driver-source";
        url = "https://github.com/eurogroep/fadecandy_ros-release.git";
        rev = "181ceb15e2948bd0a7161601e81ca79ee40fd44f";
        hash = "sha256-vKVobWiL7K0Gp4DsQRGbGKEAXcnAkWd1VaMEtdLYe3Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fadecandy_driver";
  version = "1.0.2-1";
  src = sources.fadecandy_driver;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ pkg-config ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_updater fadecandy_msgs libusb1 rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
