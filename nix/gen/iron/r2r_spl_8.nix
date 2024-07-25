{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  splsm_8_conversion,
  substituteSource,
}:
let
  sources = rec {
    r2r_spl_8 = substituteSource {
      src = fetchgit {
        name = "r2r_spl_8-source";
        url = "https://github.com/ros2-gbp/r2r_spl-release.git";
        rev = "9dac67ff9820f1cb883f03762a07339ebf8b8986";
        hash = "sha256-1XniuuU7KDJvTmwUpU/Qi0LUzw1lFpv4wH7a/LCF8lA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "r2r_spl_8";
  version = "3.1.0-1";
  src = sources.r2r_spl_8;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy splsm_8_conversion ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
}
