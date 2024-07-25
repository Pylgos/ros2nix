{
  ament_cmake,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gazebo_ros_pkgs,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    as2_gazebo_classic_assets = substituteSource {
      src = fetchgit {
        name = "as2_gazebo_classic_assets-source";
        url = "https://github.com/ros2-gbp/aerostack2-release.git";
        rev = "9312346effe0c1026eb46344f561461cad78bdb7";
        hash = "sha256-T7nEpROwuPjBHkuIIgb2aM2DlsWEppYA4iJbRxKTpxo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "as2_gazebo_classic_assets";
  version = "1.0.9-1";
  src = sources.as2_gazebo_classic_assets;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.jinja2 ];
  buildInputs = [  ];
  propagatedBuildInputs = [ gazebo_ros_pkgs rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
