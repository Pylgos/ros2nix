{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_xml,
  python3Packages,
  rclpy,
  rmf_fleet_adapter_python,
  rmf_fleet_msgs,
  rmf_task_msgs,
  substituteSource,
}:
let
  sources = rec {
    rmf_demos_fleet_adapter = substituteSource {
      src = fetchgit {
        name = "rmf_demos_fleet_adapter-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "d2f0ae7941e5a3e6e80363b12c21459549f20dee";
        hash = "sha256-dFYB9ED6GHbtco3ON4yzv8St6msZjkHD7rh0QiCmyC4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_demos_fleet_adapter";
  version = "2.4.0-1";
  src = sources.rmf_demos_fleet_adapter;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ launch_xml buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.numpy python3Packages.pyproj python3Packages.requests rclpy rmf_fleet_adapter_python rmf_fleet_msgs rmf_task_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
