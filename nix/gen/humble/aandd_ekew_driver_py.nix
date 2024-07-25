{
  action_msgs,
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
  weight_scale_interfaces,
}:
let
  sources = rec {
    aandd_ekew_driver_py = substituteSource {
      src = fetchgit {
        name = "aandd_ekew_driver_py-source";
        url = "https://github.com/ros2-gbp/aandd_ekew_driver_py-release.git";
        rev = "528affc79fa3d65174e5784a404eb0d14be995c1";
        hash = "sha256-8WW7GCR9IFM7AA7DlOdURW8bhelPxZcjteY9JtEWs3s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "aandd_ekew_driver_py";
  version = "0.0.2-3";
  src = sources.aandd_ekew_driver_py;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs python3Packages.pyserial rclpy weight_scale_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
