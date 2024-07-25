{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    twist_stamper = substituteSource {
      src = fetchgit {
        name = "twist_stamper-source";
        url = "https://github.com/ros2-gbp/twist_stamper-release.git";
        rev = "96c2ab9a1cddc4cf1e9f546c3de816ea3c83b611";
        hash = "sha256-AE3PKMNhcFfc7nbMllXSYBoKhQmRVHLCirRpDAEknEQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "twist_stamper";
  version = "0.0.3-3";
  src = sources.twist_stamper;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
